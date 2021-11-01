import 'dart:ffi';

import 'package:dart_nats_streaming/dart_nats_streaming.dart';

// ignore: implementation_imports
import 'package:dart_nats_streaming/src/data_message.dart';

// ignore: implementation_imports
import 'package:dart_nats_streaming/src/subscription.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';

const PUBLIC_CHATS = 'ink.messaging.public';
const GROUP_CHANNEL = 'ink.messaging.group';
const PRIVATE_USER = 'ink.messaging.private';

const ADD_ACTION = 'add';
const DELETE_ACTION = 'delete';

@singleton
class NatsProvider {
  Future<bool> load() async {
    _stan.onConnect(function: () {
      print('Stan connected..');
    });
    _stan.onDisconnect(function: () {
      print('Stan disconnected..');
    });
    var connected = await _connect();
    if (!connected) {
      throw NoConnectionException();
    }
    _listenPublicChatList();
    _listenPrivateUserChatList();
    var userId = await _getUserId();
    var channel = getPrivateUserTextChannel(userId);
    await subscribeToChannel(channel, (channel, message) async {});
    sendTextMessageToChannel(channel, userId);
    return true;
  }

  /// Send [text] message to [channel]
  Future<bool> sendTextMessageToChannel(String channel, String text) async {
    var userId = await _getUserId();
    NatsMessage message = NatsMessage(from: userId, to: channel);
    message.setPayload(text);
    return _sendMessage(channel, message);
  }

  /// Send [document] message to [channel]
  Future<bool> sendDocumentMessageToChannel(
      String channel, List<int> document) async {
    var userId = await _getUserId();
    NatsMessage message = NatsMessage(from: userId, to: channel);
    message.setBinaryPayload(document);
    return _sendMessage(channel, message);
  }

  /// Send system message which contains [fields] to [channel] by [type]
  Future<bool> sendSystemMessageToChannel(
      String channel, MessageType type, Map<String, String> fields) async {
    var userId = await _getUserId();
    NatsMessage message = NatsMessage(
      from: userId,
      to: channel,
    );
    message.setSystemPayload(type, fields);
    return _sendMessage(channel, message);
  }

  Iterable<String> get subscribedChannels => _channelSubscriptions.keys;

  /// Subscribe to [channel] using [startSequence] if needed
  Future<void> subscribeToChannel(String channel,
      Future<void> Function(String, NatsMessage) onMessageFuture,
      {Int64 startSequence = Int64.ZERO}) async {
    if (!_channelSubscriptions.containsKey(channel)) {
      var subscription =
          await _subscribeToChannel(channel, startSequence: startSequence);

      _listenBySubscription(channel, subscription);
      _channelSubscriptions[channel] = subscription;
      _channelCallbacks[channel] = onMessageFuture;
    }
  }

  /// Unsubscribe from [channel] using [startSequence] if needed
  Future<void> unsubscribeFromChannel(String channel) async {
    if (_channelSubscriptions.containsKey(channel)) {
      _channelSubscriptions.remove(channel);
    }
    if (_channelCallbacks.containsKey(channel)) {
      _channelCallbacks.remove(channel);
    }
  }

  //////////////////////////////// NATS Protocol ///////////////////////////////

  Future<bool> _connect() async {
    var clientID = await _getUserId();
    var connectResult = await _stan.connect(
        host: Urls.natsHost,
        port: Urls.natsPort,
        clusterID: Urls.natsCluster,
        clientID: clientID);
    return connectResult;
  }

  Future<bool> _sendMessage(String channel, NatsMessage message) async {
    return await _stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  Future<String> _getUserId() async {
    JwtPayload? authUser = await Token.getJwtPayloadObject();
    return authUser!.userId.toString();
  }

  Future<String> _getDeviceVirtualId() async {
    var deviceVirtualId = await Token.getDeviceVirtualId();
    return deviceVirtualId!;
  }

  String getPublicChatList() =>
      '$PUBLIC_CHATS.${describeEnum(MessageType.ChatList)}';

  String getPrivateUserChatList(String userId) =>
      '$PRIVATE_USER.${describeEnum(MessageType.ChatList)}.$userId';

  String getPrivateUserTextChannel(String userId) =>
      '$PRIVATE_USER.${describeEnum(MessageType.Text)}.$userId';

  String getGroupTextChannel(String chatId) =>
      '$GROUP_CHANNEL.${describeEnum(MessageType.Text)}.$chatId';

  String getInvitations(int userId) =>
      '$PRIVATE_USER.${describeEnum(MessageType.InviteUserToJoinChat)}.$userId';

  NatsMessage _parseMessage(dataMessage) {
    var payload = (dataMessage as DataMessage).encodedPayload;
    var sequence = dataMessage.sequence;
    var message = NatsMessage.fromBytes(payload);
    message.sequence = sequence;
    return message;
  }

  Future<void> _listenPublicChatList({Int64 startSequence = Int64.ZERO}) async {
    await listenChatList(getPublicChatList(), publicChatIdList,
        startSequence: startSequence);
  }

  Future<void> _listenPrivateUserChatList(
      {Int64 startSequence = Int64.ZERO}) async {
    var userId = await _getUserId();
    await listenChatList(getPrivateUserChatList(userId), userChatIdList,
        startSequence: startSequence);
  }

  Future<void> listenChatList(String channel, Set<String> chatIdList,
      {Int64 startSequence = Int64.ZERO}) async {
    var _subscriptionToPublicChannel =
        await _subscribeToChannel(channel, startSequence: startSequence);
    await for (final dataMessage in _subscriptionToPublicChannel!.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.type == MessageType.ChatList) {
        systemPayload.fields.forEach((channel, action) {
          if (action == ADD_ACTION || action.isEmpty) {
            chatIdList.add(channel);
          } else if (action == DELETE_ACTION) {
            chatIdList.remove(channel);
          }
        });
      }
      if (message.needAck) {
        _stan.acknowledge(_subscriptionToPublicChannel, dataMessage);
      }
    }
  }

  Future<Subscription?> _subscribeToChannel(channel,
      {Int64 startSequence = Int64.ZERO}) async {
    var clientId = await _getUserId();
    var deviceVirtualId = await _getDeviceVirtualId();
    var durableName = "$clientId-$deviceVirtualId-$channel";
    var subscription = startSequence != Int64.ZERO
        ? await _stan.subscribe(
            subject: channel,
            durableName: durableName,
            startSequence: startSequence)
        : await _stan.subscribe(subject: channel, durableName: durableName);
    return subscription;
  }

  Future<void> _listenBySubscription(channel, subscription) async {
    await for (final dataMessage in subscription!.stream) {
      if (_channelSubscriptions.containsKey(channel)) {
        NatsMessage message = _parseMessage(dataMessage);

        await _onMessage(channel, message);
        Future<void> Function(String, NatsMessage) channelCallback =
            _channelCallbacks[channel]!;
        await channelCallback(channel, message);
        if (message.needAck) {
          _stan.acknowledge(subscription!, dataMessage);
        }
      } else {
        break;
      }
    }
  }

  final Future<void> Function(String, NatsMessage) _onMessage =
      (channel, message) async {
    //print("_onMessage [channel: $channel, message: $message]");
  };

  final _stan = Client();
  final Set<String> userChatIdList = {};
  final Set<String> publicChatIdList = {};
  final Map<String, Subscription?> _channelSubscriptions = {};
  final Map<String, Future<void> Function(String, NatsMessage)>
      _channelCallbacks = {};
}
