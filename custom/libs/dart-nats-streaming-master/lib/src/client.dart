// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:dart_nats_streaming/src/data_message.dart';
import 'package:dart_nats_streaming/src/protocol.dart';
import 'package:dart_nats_streaming/src/subscription.dart';
import 'package:fixnum/fixnum.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import 'package:retry/retry.dart';
import 'package:uuid/uuid.dart';

class WssHttpOverrides extends HttpOverrides {
  final List<int> certificate;
  static final _logger = Logger('WssHttpOverrides');

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    _logger.finest('createHttpClient');
    SecurityContext _ctx = context ?? SecurityContext();
    _ctx.setTrustedCertificatesBytes(certificate);
    var client = super.createHttpClient(_ctx);
    //todo: Убрать после проверки этот коллбэк это Security Issue
    client.badCertificateCallback = (_, host, port) => true;
    return client;
  }

  WssHttpOverrides(this.certificate);
}

class NatsStreamingClient {
  // ####################################################
  //                      Factories
  // ####################################################

  static final NatsStreamingClient _client = NatsStreamingClient._constructor();

  static final Logger _logger = Logger('NatsStreamingClient');

  Timer? _pingTimer;

  factory NatsStreamingClient() {
    return _client;
  }

  NatsStreamingClient._constructor();

  // ####################################################
  //                      Attributes
  // ####################################################

  late nats.Client natsClient;
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
  int retryInterval = 2;
  int pingMaxAttempts = 3;
  int failPings = 0;
  int pingInterval = 10;
  int timeout = 5;
  nats.ConnectOption? connectOption;
  String clusterID = 'default';

  // ####################################################
  //                      Getters
  // ####################################################

  bool get connected => _connected;

  String get clientID => _clientID;

  List<int> get connectionIDAscii => ascii.encode(this.connectionID);

  int LIMIT_REDELIVERY = 3;

  // ####################################################
  //                      Methods
  /// Support ws/wss schemas using [uri] to connect to NATS.
  /// Also support self-signed certificate
  Future<bool> connectUri(
    Uri uri, {
    int? timeoutSeconds,
    nats.ConnectOption? connectOption,
    bool? retryReconnect,
    int? retryIntervalSeconds,
    String? clientID,
    String? clusterID,
    int? pingIntervalSeconds,
    int? pingMaxAttempts,
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
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(
        Duration(seconds: this.pingInterval), (_) async => await _heartbeat());

    return await _connect();
  }

  Future<bool> _connect() async {
    _logger.finest('_connect');
    _connected = false;
    natsClient = nats.Client();
    if (uri != null && uri!.scheme == 'wss') {
      await _wssConnect();
    } else {
      await _tcpConnect();
    }
    _logger.finest('_connect NATS Status: ${natsClient.status}');

    if (natsClient.status == nats.Status.connected) {
      _logger.finest('NATS request');

      ConnectRequest connectRequest = ConnectRequest()
        ..clientID = this.clientID
        ..heartbeatInbox = this.connectionID
        ..connID = this.connectionIDAscii
        ..protocol = 1
        ..pingInterval = pingInterval
        ..pingMaxOut = this.pingMaxAttempts;

      // Connecting to Streaming Server
      try {
        final _req = await natsClient.request(
            '_STAN.discover.$clusterID', connectRequest.writeToBuffer(),
            timeout: Duration(seconds: timeout));
        _connectResponse = ConnectResponse.fromBuffer((_req).data);
        _logger.finest('$_req');
        unawaited(pingResponseWatchdog());
        _logger.finest(() => 'Response: $_connectResponse');
        if (_connectResponse?.hasError() ?? false) {
          throw 'NATS protocol: $_connectResponse';
        }
        _connected = true;
      } catch (e) {
        _logger.severe('Error during connect request', e);

        try {
          await natsClient.close();
        } catch (e) {
          _logger.severe('Error during clean and close', e);
        }
        _connected = false;
      }
      if (_connected && _onConnect != null) {
        _onConnect!();
      }
    }
    return _connected;
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
    } catch (e, s) {
      _logger.severe('Connecting Error', e, s);
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
    } catch (e, s) {
      _logger.severe('Connecting Error', e, s);
    }
  }

  Future<void> manualDisconnect() async {
    _pingTimer?.cancel();
    retryReconnect = false;
    failPings = 0;
    await _disconnect();
  }

  Future<void> _disconnect() async {
    _logger.finest('_disconnect');
    try {
      if (_onDisconnect != null) {
        _onDisconnect!();
      }
    } catch (e, s) {
      _logger.severe('Failed during call onDisconnect', e, s);
    }
    try {
      await natsClient.close();
    } catch (e, s) {
      _logger.severe('Failed during close nats client', e, s);
    }

    _logger.finest('_disconnect finished: NATS STATUS: ${natsClient.status}');
    _connected = false;
  }

  Future<void> _heartbeat() async {
    _logger.finest('_heartbeat');
    bool p = await pingWithTimeout();
    if (p) {
      failPings = 0;
    } else {
      failPings++;
      _logger.finest(() => 'PING Fail. Attempt: [$failPings/$pingMaxAttempts]');
    }
    _logger.finest(() => 'NATS STATUS: ${natsClient.status}');

    if (failPings >= pingMaxAttempts ||
        natsClient.status != nats.Status.connected) {
      _logger.finest('retryReconnect: $retryReconnect');
      if (retryReconnect) {
        await _reconnect();
      } else {
        await _disconnect();
      }
    }
  }

  Future<void> _reconnect() async {
    _logger.finest('_reconnect');
    if (connected) await _disconnect();
    await Future.delayed(Duration(seconds: retryInterval), () => {});
    _logger.finest('_reconnect: after waiting retryInterval');
    await _connect();
  }

  Future<void> pingResponseWatchdog() async {
    _inboxSub = natsClient.sub(connectionID);
    await for (nats.Message message in _inboxSub!.stream!) {
      try {
        natsClient.pubString(message.replyTo!, '');
      } catch (e) {
        _logger.severe('PING FAILED', e);
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
    _logger.finest('ping');
    if (natsClient.status != nats.Status.connected) {
      return false;
    }
    Ping ping = Ping()..connID = connectionIDAscii;
    try {
      nats.Message message = await natsClient.request(
          _connectResponse!.pingRequests, ping.writeToBuffer());

      return message.string.isEmpty;
    } catch (e, s) {
      _logger.severe('Error during PING', e, s);
      return false;
    }
  }

  Future<bool> pingWithTimeout() async {
    _logger.finest('pingWithTimeout');
    try {
      final hasPing = await ping().timeout(Duration(seconds: timeout));

      return hasPing;
    } catch (e) {
      return false;
    }
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
      } catch (e, s) {
        _logger.severe('Publishing Fail', e, s);
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
      } catch (e, s) {
        _logger.severe('Publishing Fail', e, s);

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

  Future<Subscription> subscribe({
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
    if (!connected) throw 'Not connected';
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
      var tryToSubscribeResponse = await tryToSubscribe(subscriptionRequest);
      if (tryToSubscribeResponse != null &&
          !_subscriptionInboxes.contains(tryToSubscribeResponse.ackInbox)) {
        SubscriptionResponse subscriptionResponse = tryToSubscribeResponse;
        _logger.finest(() =>
            'ACK INBOX - $subject - ${subscriptionResponse.ackInbox} WITH POSITION - $startPosition AND SEQUENCE - $startSequence');
        _subscriptionInboxes.add(subscriptionResponse.ackInbox);
        return Subscription(
          subscription: natsSubscription,
          subscriptionRequest: subscriptionRequest,
          ackInbox: subscriptionResponse.ackInbox,
        );
      }
      await Future.delayed(Duration(milliseconds: i * 300));
    }

    throw 'Could not subscribe to channel $subject';
  }

  Future<SubscriptionResponse?> tryToSubscribe(
      SubscriptionRequest subscriptionRequest) async {
    if (!_client.connected) return null;

    try {
      final _req = await natsClient.request(
        _connectResponse!.subRequests,
        subscriptionRequest.writeToBuffer(),
        queueGroup: subscriptionRequest.qGroup,
        timeout: Duration(seconds: timeout),
      );

      SubscriptionResponse subscriptionResponse =
          SubscriptionResponse.fromBuffer(_req.data);

      if (subscriptionResponse.hasError()) {
        throw Exception(subscriptionResponse.error);
      }

      return subscriptionResponse;
    } catch (e, s) {
      _logger.severe(
          'Error for channel ${subscriptionRequest.subject}: $e', e, s);
    }
    return null;
  }

  Map<String, int> unAcknowledgedCounter = {};

  bool acknowledge(Subscription subscription, DataMessage dataMessage,
      {Function(Subscription, DataMessage)? unacknowledgedMessageHandler}) {
    if (!_client.connected) return false;

    Ack ack = Ack()
      ..subject = dataMessage.subject
      ..sequence = dataMessage.sequence;

    bool ackSendSuccess = false;
    try {
      ackSendSuccess =
          natsClient.pub(subscription.ackInbox, ack.writeToBuffer());
      if (!ackSendSuccess) {
        _logger.warning('ACK failed');
      }
    } catch (e, s) {
      _logger.severe('Error during send ACK', e, s);
    }

    if (dataMessage.isRedelivery) {
      subscription.redeliveryCounter++;
    }

    if (subscription.redeliveryCounter >= LIMIT_REDELIVERY || !ackSendSuccess) {
      _handleAckErrors(subscription, dataMessage, ackSendSuccess);
      return false;
    }

    return true;
  }

  void _handleAckErrors(
      Subscription subscription, DataMessage dataMessage, bool ackSendResult) {
    final channel = subscription.subject;
    if (subscription.redeliveryCounter >= LIMIT_REDELIVERY) {
      _logger.warning(() =>
          'CLOSED $channel after $LIMIT_REDELIVERY unacknowledged messages to prevent possible forever redelivering');
    }

    if (!ackSendResult) {
      _logger.warning(() => 'CLOSED $channel because error during ACK send');
    }
    subscription.subscription.close();
    natsClient.unSub(subscription.subscription);
    return;
  }
}
