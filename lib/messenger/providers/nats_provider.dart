import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:dart_nats_streaming/dart_nats_streaming.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/invite_payload.dart';
import 'package:ink_mobile/messenger/models/chat/nats/requests/auth_request.dart';
import 'package:ink_mobile/messenger/models/chat/nats/requests/auth_response.dart';
import 'package:ink_mobile/messenger/models/chat/nats/requests/create_chat_request.dart';
import 'package:ink_mobile/messenger/models/chat/nats/requests/create_chat_response.dart';
import 'package:ink_mobile/messenger/models/chat/nats/requests/invite_request.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

import '../constants/nats_constants.dart';

const SYSTEM = 'system';
const DOMAIN = 'ink.messaging';
const PROTOCOL = 'v1';
const PUBLIC = '$DOMAIN.$PROTOCOL.public';
const GROUP = '$DOMAIN.$PROTOCOL.group';
const PRIVATE_USER = '$DOMAIN.$PROTOCOL.private';
const AUTH = '$SYSTEM.$DOMAIN.$PROTOCOL.chat_auth';
const CREATE_CHAT = '$SYSTEM.$DOMAIN.$PROTOCOL.create_chat';
const INVITE = '$SYSTEM.$DOMAIN.$PROTOCOL.invite';

const DELETE_ACTION = 'delete';

@lazySingleton
class NatsProvider {
  static final _logger = Logger('NatsProvider');

  late NatsStreamingClient _stan;
  final String natsWssUrl;
  final String natsCluster;
  final Uint8List certificate;

  final String userId;
  final String deviceVirtualId;
  final String natsToken;

  ///
  /// Check if object was disposed by [dispose]
  ///
  bool isDisposed = false;

  late AuthResponse authResponse;

  NatsProvider({
    @Named("natsWssUrl") required this.natsWssUrl,
    @Named("natsCluster") required this.natsCluster,
    @Named("userId") required this.userId,
    @Named("deviceVirtualId") required this.deviceVirtualId,
    @Named("natsToken") required this.natsToken,
    @Named("natsCertificate") required this.certificate,
  });

  Future<bool> load() async {
    this._stan = NatsStreamingClient();
    _stan.onConnect(function: () {
      onConnected();
      _connected();
    });
    _stan.onDisconnect(function: () {
      onDisconnected();
      _disconnected();
    });
    return await _connect();
  }

  void _connected() {
    _logger.info('Stan connected..');
  }

  void _disconnected() {
    _logger.info('Stan disconnected..');
  }

  ///
  /// Dispose object, clear memory and close connection.
  /// Please don't use object after dispose please check [isDisposed]
  ///
  Future<void> dispose() async {
    userChatIdList.clear();
    publicChatIdList.clear();
    await _stan.manualDisconnect();
    isDisposed = true;
  }

  /// Send [text] message to [channel]
  Future<bool> sendTextMessageToChannel(String channel, String text) async {
    if (channel.contains(describeEnum(MessageType.Text))) {
      NatsMessage message = NatsMessage(from: userId, to: channel);
      message.setMessagePayload(text);
      return _sendMessage(channel, message);
    } else {
      throw WrongChannelUsedToPubMessageException(message: 'channel: $channel');
    }
  }

  /// Send [document] message to [channel]
  Future<bool> sendDocumentMessageToChannel(
      String channel, List<int> document) async {
    if (channel.contains(describeEnum(MessageType.Document))) {
      NatsMessage message = NatsMessage(from: userId, to: channel);
      message.setBinaryPayload(document);
      return _sendMessage(channel, message);
    } else {
      throw WrongChannelUsedToPubMessageException(message: 'channel: $channel');
    }
  }

  /// Send system message which contains [fields] to [channel] by [type]
  Future<bool> sendSystemMessageToChannel(
      String channel, MessageType type, Map<String, String> fields) async {
    NatsMessage message = NatsMessage(
      from: userId,
      to: channel,
    );
    message.setSystemPayload(type, fields);
    bool sent = await _sendMessage(channel, message);

    return sent;
  }

  /// Send system message which contains [fields] to [channel] by [type]
  Future<bool> sendJsonMessageToChannel(
      String channel, MessageType type, Map<String, dynamic> json) async {
    NatsMessage message = NatsMessage(
      from: userId,
      to: channel,
    );
    message.setJsonPayload(type, json);
    bool sent = await _sendMessage(channel, message);

    return sent;
  }

  Iterable<String> get subscribedChannels => _channelSubscriptions.keys;

  /// Subscribe to [channel] using [startSequence] if needed
  Future<void> subscribeToChannel(
    String channel,
    Future<void> Function(String, NatsMessage) onMessageFuture, {
    Int64 startSequence = Int64.ZERO,
    int ackWaitSeconds = 5,
    maxInFlight = 1,
    startPosition = StartPosition.SequenceStart,
  }) async {
    if (!_channelSubscriptions.containsKey(channel)) {
      _logger.finest("subscribeToChannel: $channel");
      var subscription = await _stan.subscribe(
        subject: channel,
        maxInFlight: maxInFlight,
        ackWaitSeconds: ackWaitSeconds,
        startPosition: startPosition,
        startSequence: startSequence,
      );

      _listenBySubscription(channel, subscription);
      _channelSubscriptions[channel] = subscription;
      _channelCallbacks[channel] = onMessageFuture;
    } else {
      throw SubscriptionAlreadyExistException(message: 'channel: $channel');
    }
  }

  /// Unsubscribe from [channel] using [startSequence] if needed
  Future<void> unsubscribeFromChannel(String channel) async {
    _stan.unsubscribeByChannel(channel);

    if (_channelSubscriptions.containsKey(channel)) {
      _channelSubscriptions[channel]?.subscription.close();
      _channelSubscriptions.remove(channel);
    }
    if (_channelCallbacks.containsKey(channel)) {
      _channelCallbacks.remove(channel);
    }

    //_logger.info('_channelSubscriptions: ${_channelSubscriptions.keys}');
  }

  //////////////////////////////// NATS Protocol ///////////////////////////////

  Future<bool> _connect() async {
    _logger.finest("_connect");
    _logger.finest(() =>
        "url: $natsWssUrl, cluster: $natsCluster, userId: $userId, natsToken: $natsToken");
    _logger.finest(() => "certificate data length: ${certificate.length}");

    var connectResult = await _stan.connectUri(Uri.parse(natsWssUrl),
        certificate: certificate,
        clusterID: natsCluster,
        timeoutSeconds: NATS_TIMEOUT_SEC,
        pingIntervalSeconds: NATS_PING_INTERVAL_SEC,
        pingMaxAttempts: NATS_PING_MAX_ATTEMPTS,
        retryIntervalSeconds: NATS_RETRY_INTERVAL_SEC,
        clientIdPrefix: "$userId-$deviceVirtualId",
        retryReconnect: true,
        connectOption:
            nats.ConnectOption(tlsRequired: true, auth_token: natsToken));
    return connectResult;
  }

  Future<bool> ping() async {
    return _stan.pingWithTimeout();
  }

  Future<bool> auth(
      {required String login,
      required String password,
      int timeoutInSeconds = 5}) async {
    _logger.finest("auth");
    try {
      var response = await _stan.natsClient.requestString(AUTH,
          jsonEncode(AuthRequest(login: login, password: password).toJson()),
          timeout: Duration(seconds: timeoutInSeconds));
      authResponse = AuthResponse.fromJson(jsonDecode(response.string));
      _logger.finest(() => "auth response: ${authResponse.toJson()}");
    } catch (e, s) {
      _logger.severe("Auth error", e, s);
      return false;
    }
    return true;
  }

  Future<CreateChatResponse?> createChat(
      {int timeoutInSeconds = 5, String? participantId}) async {
    _logger.finest("createChat");
    try {
      var response = await _stan.natsClient.requestString(
          CREATE_CHAT,
          jsonEncode(CreateChatRequest(
                  token: authResponse.token,
                  ownerId: userId,
                  participantId: participantId)
              .toJson()),
          timeout: Duration(seconds: timeoutInSeconds));
      return CreateChatResponse.fromJson(jsonDecode(response.string));
    } catch (e, s) {
      _logger.severe("Chat create error", e, s);
    }
    return null;
  }

  Future<bool> invite(List<InvitePayload> invites,
      {int timeoutInSeconds = 5}) async {
    _logger.finest(() => "invite: $invites");

    try {
      var data = jsonEncode(
          InviteRequest(token: authResponse.token, invites: invites).toJson());
      _logger.finest("Sending: $data");
      await _stan.natsClient.request(
          INVITE, Uint8List.fromList(utf8.encode(data)),
          timeout: Duration(seconds: timeoutInSeconds));
      return true;
    } catch (e, s) {
      _logger.severe("Chat create error", e, s);
    }
    return false;
  }

  Future<bool> _sendMessage(String channel, NatsMessage message) async {
    return await _stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  String getPrivateUserChatIdList() => authResponse.data.chatListChannel;

  String getInviteUserToJoinChatChannel() => authResponse.data.inviteChannel;

  String getOnlineChannel() =>
      '$SYSTEM.$PUBLIC.${describeEnum(MessageType.Online)}';

  NatsMessage parseMessage(DataMessage dataMessage) {
    var payload = dataMessage.encodedPayload;
    var sequence = dataMessage.sequence;
    dynamic json;
    try {
      var source = utf8.decode(payload.toList());
      json = jsonDecode(source);
    } catch (e) {}
    NatsMessage message;
    if (json != null) {
      message = NatsMessage(
          id: Uuid().v4(), type: PayloadType.json, to: dataMessage.subject);
      message.payload = JsonPayload(MessageType.InviteUserToJoinChat, json);
    } else {
      message = NatsMessage.fromStructuredPayload(payload);
    }
    message.sequence = sequence;
    message.timestamp = DateTime.fromMillisecondsSinceEpoch(
        (dataMessage.timestamp.toDouble() / 1e6).truncate(),
        isUtc: true);
    return message;
  }

  Future<Subscription> listenChatList(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    var _subscriptionToPublicChannel = await _stan.subscribe(
      subject: channel,
      startPosition: StartPosition.LastReceived,
    );
    return _subscriptionToPublicChannel;
  }

  Future<void> _listenBySubscription(
      channel, Subscription? subscription) async {
    if (subscription == null) return;

    subscription.listen((dataMessage) {
      try {
        _logger.finest("Received data from channel: ${subscription.subject}");
        if (!acknowledge(subscription, dataMessage)) return;

        if (!_channelSubscriptions.containsKey(channel)) return;
        if (!dataMessage.isRedelivery) {
          NatsMessage message = parseMessage(dataMessage);
          onMessage(channel, message);
          Future<void> Function(String, NatsMessage) channelCallback =
              _channelCallbacks[channel]!;
          channelCallback(channel, message);
        }
      } catch (e, s) {
        _logger.severe("Error during read stream of channel $channel", e, s);
      }
    });
  }

  bool acknowledge(Subscription subscription, DataMessage message) {
    _logger.finest("acknowledge: ${subscription.subject}");
    return _stan.acknowledge(
      subscription,
      message,
      unacknowledgedMessageHandler: _unAcknowledgedMessageHandler,
    );
  }

  Future<void> _unAcknowledgedMessageHandler(
      Subscription subscription, DataMessage message) async {
    final String channel = subscription.subject;

    if (_channelCallbacks.containsKey(channel)) {
      Future<void> Function(String, NatsMessage) channelCallback =
          _channelCallbacks[channel]!;

      onUnacknowledged(subscription, message, channelCallback);
    }
  }

  final Set<String> userChatIdList = {};
  final Set<String> publicChatIdList = {};
  final Map<String, Subscription?> _channelSubscriptions = {};

  Future<void> Function(String, NatsMessage) onMessage =
      (channel, message) async {
    _logger.info(message);
  };
  final Map<String, Future<void> Function(String, NatsMessage)>
      _channelCallbacks = {};

  Future<void> Function() onConnected = () async {};
  Future<void> Function() onDisconnected = () async {};
  Future<void> Function(
          Subscription, DataMessage, Future<void> Function(String, NatsMessage))
      onUnacknowledged = (subscription, message, onMessage) async {};

  bool get isConnected {
    try {
      return _stan.connected;
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendEmptyMessageToChannel(
      String channel, MessageType type) async {
    NatsMessage message = NatsMessage(from: userId, to: channel);
    message.setEmptyPayload();
    return _sendMessage(channel, message);
  }
}
