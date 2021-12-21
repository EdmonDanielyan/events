// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:io';

import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:dart_nats_streaming/src/data_message.dart';
import 'package:dart_nats_streaming/src/protocol.dart';
import 'package:dart_nats_streaming/src/subscription.dart';
import 'package:fixnum/fixnum.dart';
import 'package:pedantic/pedantic.dart';
import 'package:retry/retry.dart';
import 'package:uuid/uuid.dart';

class WssHttpOverrides extends HttpOverrides {
  final List<int> certificate;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    SecurityContext _ctx = context ?? SecurityContext();
    _ctx.setTrustedCertificatesBytes(certificate);
    var client = super.createHttpClient(_ctx);
    return client;
  }

  WssHttpOverrides(this.certificate);
}

class Client {
  // ####################################################
  //                      Factories
  // ####################################################

  static final Client _client = Client._constructor();

  factory Client() {
    return _client;
  }

  Client._constructor();

  // ####################################################
  //                      Attributes
  // ####################################################

  final nats.Client natsClient = nats.Client();
  final String connectionID = Uuid().v4();
  String _clientID = Uuid().v4();
  bool _connected = false;
  ConnectResponse? _connectResponse;
  Function? _onConnect;
  Function? _onDisconnect;
  nats.Subscription? _inboxSub;

  // ####################################################
  //                Configuration Attributes
  // ####################################################

  Uri? uri;
  String host = '';
  int port = 4222;
  bool retryReconnect = true;
  int retryInterval = 10;
  int pingMaxAttempts = 3;
  int failPings = 0;
  int pingInterval = 5;
  int timeout = 10;
  nats.ConnectOption? connectOption;
  String clusterID = 'default';

  // ####################################################
  //                      Getters
  // ####################################################

  bool get connected => _connected;

  String get clientID => _clientID;

  List<int> get connectionIDAscii => ascii.encode(this.connectionID);

  // ####################################################
  //                      Methods
  /// Support ws/wss schemas using [uri] to connect to NATS.
  /// Also support self-signed certificate
  Future<bool> connectUri(
    Uri uri, {
    int timeoutSeconds = 10,
    nats.ConnectOption? connectOption,
    bool retryReconnect = true,
    int retryIntervalSeconds = 10,
    String? clientID,
    String clusterID = 'default',
    int pingIntervalSeconds = 5,
    int pingMaxAttempts = 3,
    List<int>? certificate,
  }) {
    this.uri = uri;
    if (certificate != null && certificate.isNotEmpty) {
      return HttpOverrides.runWithHttpOverrides(() {
        return connect(
            host: uri.host,
            port: uri.port,
            timeout: timeoutSeconds,
            connectOption: connectOption,
            retryReconnect: retryReconnect,
            retryInterval: retryIntervalSeconds,
            clientID: clientID,
            clusterID: clusterID,
            pingInterval: pingIntervalSeconds,
            pingMaxAttempts: pingMaxAttempts);
      }, WssHttpOverrides(certificate));
    } else {
      return connect(
          host: uri.host,
          port: uri.port,
          timeout: timeoutSeconds,
          connectOption: connectOption,
          retryReconnect: retryReconnect,
          retryInterval: retryIntervalSeconds,
          clientID: clientID,
          clusterID: clusterID,
          pingInterval: pingIntervalSeconds,
          pingMaxAttempts: pingMaxAttempts);
    }
  }

  // ####################################################

  ///
  @Deprecated('Use connectUri instead')
  Future<bool> connect({
    required String host,
    int port = 4222,
    int? timeout,
    nats.ConnectOption? connectOption,
    bool? retryReconnect,
    int? retryInterval,
    String? clientID,
    String? clusterID,
    int? pingInterval,
    int? pingMaxAttempts,
  }) async {
    this.host = host;
    this.port = port;

    if (clientID != null) {
      _clientID = clientID;
    }

    if (retryReconnect != null) {
      this.retryReconnect = retryReconnect;
    }

    if (pingMaxAttempts != null) {
      this.pingMaxAttempts = pingMaxAttempts;
    }

    if (connectOption != null) {
      this.connectOption = connectOption;
    }

    if (retryInterval != null) {
      this.retryInterval = retryInterval;
    }

    if (clusterID != null) {
      this.clusterID = clusterID;
    }

    if (pingInterval != null) {
      this.pingInterval = pingInterval;
    }

    if (timeout != null) {
      this.timeout = timeout;
    }

    return await _connect();
  }

  Future<bool> _connect() async {
    if (uri != null && uri!.scheme == 'wss') {
      await _wssConnect();
    } else {
      await _tcpConnect();
    }

    Future.delayed(Duration(seconds: pingInterval), () => _heartbeat());

    if (natsClient.status == nats.Status.connected) {
      // Generante new clientID for reconnection

      ConnectRequest connectRequest = ConnectRequest()
        ..clientID = this.clientID
        ..heartbeatInbox = this.connectionID
        ..connID = this.connectionIDAscii
        ..protocol = 1
        ..pingInterval = pingInterval
        ..pingMaxOut = this.pingMaxAttempts;

      // Connecting to Streaming Server
      final _req = await natsClient.request(
          '_STAN.discover.$clusterID', connectRequest.writeToBuffer());

      _connectResponse = ConnectResponse.fromBuffer((_req).data);
      unawaited(pingResponseWatchdog());

      if (_onConnect != null) {
        _onConnect!();
      }

      _connected = true;
      return true;
    }
    return false;
  }

  Future<void> _tcpConnect() async {
    try {
      await natsClient.tcpConnect(
        host,
        port: port,
        connectOption: connectOption,
        timeout: timeout,
        retry: retryReconnect,
        retryInterval: retryInterval,
      );
    } catch (e) {
      print('Connecting Error: [$e]');
      unawaited(_reconnect());
    }
  }

  Future<void> _wssConnect() async {
    try {
      await natsClient.connect(
        uri!,
        connectOption: connectOption,
        timeout: timeout,
        retry: retryReconnect,
        retryInterval: retryInterval,
      );
    } catch (e) {
      print('Connecting Error: [$e]');
      unawaited(_reconnect());
    }
  }

  Future<void> manualDisconnect() async {
    retryReconnect = false;
    failPings = 0;
    await _disconnect();
  }

  Future<void> _disconnect() async {
    unawaited(natsClient.close());
    if (_onDisconnect != null && _connected) {
      _onDisconnect!();
    }
    _connected = false;
  }

  Future<void> _heartbeat() async {
    bool p = await ping();
    if (p) {
      failPings = 0;
      _connected = true;
    } else {
      failPings++;
      print('PING Fail. Attempt: [$failPings/$pingMaxAttempts] '
          'NATS: [${natsClient.status == nats.Status.connected ? 'connected' : 'disconnected'}]');
    }
    if (failPings >= pingMaxAttempts ||
        natsClient.status != nats.Status.connected) {
      if (retryReconnect) {
        await _reconnect();
        return;
      } else {
        await _disconnect();
      }
    }
    if (_connected) {
      Future.delayed(Duration(seconds: pingInterval), () => _heartbeat());
    }
  }

  Future<void> _reconnect() async {
    await _disconnect();
    await Future.delayed(Duration(seconds: retryInterval), () => {});
    await _connect();
  }

  Future<void> pingResponseWatchdog() async {
    _inboxSub = natsClient.sub(connectionID);
    await for (nats.Message message in _inboxSub!.stream!) {
      try {
        natsClient.pubString(message.replyTo!, '');
      } catch (_) {
        //COULD throw on manual disconnect
      }
    }
  }

  void onDisconnect({required Function function}) {
    _onDisconnect = function;
  }

  void onConnect({required Function function}) {
    _onConnect = function;
  }

  Future<bool> ping() async {
    if (!_connected || natsClient.status != nats.Status.connected) {
      return false;
    }
    Ping ping = Ping()..connID = connectionIDAscii;
    try {
      nats.Message message = await natsClient.request(
          _connectResponse!.pingRequests, ping.writeToBuffer());
      return message.string.isEmpty;
    } catch (e) {
      return false;
    }
  }

  void close() {
    _connected = false;
    natsClient.close();
    _onDisconnect!();
  }

  Future<bool> pubString({
    required String subject,
    required String string,
    String? guid,
    Function(PubMsg, dynamic)? onDeliveryFail,
  }) async {
    final r = RetryOptions(
        maxAttempts: 8, delayFactor: Duration(seconds: retryInterval));
    return await r.retry(() async {
      late PubMsg pubMsg;
      try {
        if (!connected) {
          throw Exception('Not connected');
        }
        final Encoding encoding = utf8;
        pubMsg = PubMsg()
          ..clientID = this.clientID
          ..guid = guid ?? Uuid().v4()
          ..subject = subject
          ..data = encoding.encode(string)
          ..connID = this.connectionIDAscii;
        return natsClient.pub('${this._connectResponse!.pubPrefix}.$subject',
            pubMsg.writeToBuffer());
      } catch (e) {
        print('Publishing Fail: $e');
        await _reconnect();
        if (onDeliveryFail != null) {
          onDeliveryFail(pubMsg, e.toString());
        }
        return false;
      }
    });
  }

  Future<bool> pubBytes({
    required String subject,
    required List<int> bytes,
    String? guid,
    Function(PubMsg, dynamic)? onDeliveryFail,
  }) async {
    final r = RetryOptions(
        maxAttempts: 8, delayFactor: Duration(seconds: retryInterval));
    return await r.retry(() async {
      late PubMsg pubMsg;
      try {
        if (!connected) {
          throw Exception('Not connected');
        }
        pubMsg = PubMsg()
          ..clientID = this.clientID
          ..guid = guid ?? Uuid().v4()
          ..subject = subject
          ..data = bytes
          ..connID = this.connectionIDAscii;

        String to = '${this._connectResponse!.pubPrefix}.$subject';

        return natsClient.pub(to, pubMsg.writeToBuffer());
      } catch (e) {
        print('Publishing Fail: $e');
        if (connected) {
          await _reconnect();
        }
        if (onDeliveryFail != null) {
          onDeliveryFail(pubMsg, e);
        }

        return false;
      }
    });
  }

  Future<bool> pubMsg({
    required PubMsg pubMsg,
    Function(PubMsg, dynamic)? onDeliveryFail,
  }) async {
    final r = RetryOptions(
        maxAttempts: 8, delayFactor: Duration(seconds: retryInterval));
    return await r.retry(() async {
      try {
        if (!connected) {
          throw Exception('Not connected');
        }

        String to = '${this._connectResponse!.pubPrefix}.${pubMsg.subject}';
        return natsClient.pub(to, pubMsg.writeToBuffer());
      } catch (e) {
        if (onDeliveryFail != null) {
          onDeliveryFail(pubMsg, e.toString());
        }

        return false;
      }
    });
  }

  void unsubscribeByChannel(String channel) {
    // natsClient.unSubscribeBySubject(channel);
  }

  void unsubscribeBySid(int sid) {
    //natsClient.unSubBySid(sid);
  }

  final Set<String> _subscriptionInboxes = {};

  Future<Subscription?> subscribe({
    required String subject,
    int maxInFlight = 1,
    int ackWaitSeconds = 5,
    StartPosition startPosition = StartPosition.NewOnly,
    String? queueGroup,
    String? durableName,
    Int64? startSequence,
    Int64? startTimeDelta,
    int? sid,
  }) async {
    // Listen Inbox before subscribing
    final String inbox = '${subject}_${queueGroup ?? ''}_${Uuid().v4()}';

    final natsSubscription = natsClient.sub(inbox, queueGroup: queueGroup);

    // Subscribing
    SubscriptionRequest subscriptionRequest = SubscriptionRequest()
      ..clientID = this.clientID
      ..subject = subject
      ..maxInFlight = maxInFlight
      ..ackWaitInSecs = ackWaitSeconds
      ..startPosition = startPosition
      ..inbox = inbox;

    if (queueGroup != null) subscriptionRequest.qGroup = queueGroup;
    if (durableName != null) subscriptionRequest.durableName = durableName;
    if (startSequence != null) {
      subscriptionRequest.startSequence = startSequence;
    }
    if (startTimeDelta != null) {
      subscriptionRequest.startTimeDelta = startTimeDelta;
    }

    for (int i = 1; i <= 10; i++) {
      final subscriptionResponse = await tryToSubscribe(subscriptionRequest);
      if (!_subscriptionInboxes.contains(subscriptionResponse.ackInbox)) {
        print(
            'ACK INBOX - $subject - ${subscriptionResponse.ackInbox} WITH POSITION - $startPosition AND SEQUENCE - $startSequence');
        _subscriptionInboxes.add(subscriptionResponse.ackInbox);
        return Subscription(
          subject: subject,
          subscription: natsSubscription,
          ackInbox: subscriptionResponse.ackInbox,
        );
      }
      await Future.delayed(Duration(milliseconds: i * 300));
    }

    throw 'Could not subscribe to channel $subject';
  }

  Future<SubscriptionResponse> tryToSubscribe(
      SubscriptionRequest subscriptionRequest) async {
    try {
      final _req = await natsClient.request(
        _connectResponse!.subRequests,
        subscriptionRequest.writeToBuffer(),
        queueGroup: subscriptionRequest.qGroup,
        timeout: Duration(seconds: 10),
      );

      SubscriptionResponse subscriptionResponse =
          SubscriptionResponse.fromBuffer(_req.data);

      if (subscriptionResponse.hasError()) {
        throw Exception(subscriptionResponse.error);
      }

      return subscriptionResponse;
    } catch (e) {
      throw Exception('${subscriptionRequest.subject} - $e');
    }
  }

  void acknowledge(Subscription subscription, DataMessage dataMessage) {
    Ack ack = Ack()
      ..subject = dataMessage.subject
      ..sequence = dataMessage.sequence;

    if (dataMessage.isRedelivery) {
      print(
          'NOT ACKNOWLEDGING - ${ack.subject} - ${subscription.ackInbox} - SEQ = ${ack.sequence}');
    }

    natsClient.pub(subscription.ackInbox, ack.writeToBuffer());
  }
}
