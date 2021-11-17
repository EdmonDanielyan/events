import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:dart_nats_streaming/dart_nats_streaming.dart';

// ignore: implementation_imports
import 'package:dart_nats_streaming/src/data_message.dart';

// ignore: implementation_imports
import 'package:dart_nats_streaming/src/subscription.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';

const PUBLIC_CHATS = 'ink.messaging.public';
const GROUP_CHANNEL = 'ink.messaging.group';
const PRIVATE_USER = 'ink.messaging.private';
const DELETE_ACTION = 'delete';

@lazySingleton
class NatsProvider {
  late Client _stan;
  final String natsWssUrl;
  final String natsCluster;
  final String natsCertPath;

  final String userId;
  final String deviceVirtualId;
  final String natsToken;

  NatsProvider(
      {@Named("natsWssUrl") required this.natsWssUrl,
      @Named("natsCluster") required this.natsCluster,
      @Named("natsCertPath") required this.natsCertPath,
      @Named("userId") required this.userId,
      @Named("deviceVirtualId") required this.deviceVirtualId,
      @Named("natsToken") required this.natsToken});

  Future<bool> load() async {
    this._stan = Client();
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

    _listenPrivateUserChatIdList();
    return true;
  }

  /// Send [text] message to [channel]
  Future<bool> sendTextMessageToChannel(String channel, String text) async {
    if (channel.contains(describeEnum(MessageType.Text))) {
      NatsMessage message = NatsMessage(from: userId, to: channel);
      message.setPayload(text);
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
    return await _sendMessage(channel, message);
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
    } else {
      throw SubscriptionAlreadyExistException(message: 'channel: $channel');
    }
    print('_channelSubscriptions: ${_channelSubscriptions.keys}');
  }

  /// Unsubscribe from [channel] using [startSequence] if needed
  Future<void> unsubscribeFromChannel(String channel) async {
    //await _unsubscribeByChannel(channel);

    if (_channelSubscriptions.containsKey(channel)) {
      _channelSubscriptions.remove(channel);
    }
    if (_channelCallbacks.containsKey(channel)) {
      _channelCallbacks.remove(channel);
    }

    print('_channelSubscriptions: ${_channelSubscriptions.keys}');
  }

  //////////////////////////////// NATS Protocol ///////////////////////////////

  Future<bool> _connect() async {
    var natsCert = await rootBundle.load(natsCertPath);
    var _certificate = natsCert.buffer.asUint8List();
    var connectResult = await _stan.connectUri(Uri.parse(natsWssUrl),
        certificate: _certificate,
        clusterID: natsCluster,
        clientID: userId,
        connectOption:
            nats.ConnectOption(tlsRequired: true, auth_token: natsToken));
    return connectResult;
  }

  Future<bool> _sendMessage(String channel, NatsMessage message) async {
    return await _stan.pubBytes(
        subject: channel, bytes: message.toBytes(), guid: message.id);
  }

  String getPublicChatIdList() =>
      '$PUBLIC_CHATS.${describeEnum(MessageType.ChatList)}';

  String getPrivateUserChatIdList(String userId) =>
      '$PRIVATE_USER.${describeEnum(MessageType.ChatList)}.$userId';

  String getPrivateUserTextChannel(int userId) =>
      '$PRIVATE_USER.${describeEnum(MessageType.Text)}.$userId';

  String getGroupTextChannelById(String chatId) =>
      '$GROUP_CHANNEL.${describeEnum(MessageType.Text)}.$chatId';

  String getGroupReactedChannelById(String chatId) =>
      '$GROUP_CHANNEL.${describeEnum(MessageType.UserReacted)}.$chatId';

  String getGroupJoinedChannelById(String chatId) =>
      '$GROUP_CHANNEL.${describeEnum(MessageType.UserJoined)}.$chatId';

  String getGroupLeftChannelById(String chatId) =>
      '$GROUP_CHANNEL.${describeEnum(MessageType.UserLeftChat)}.$chatId';

  String getGroupDeleteMessageChannelById(String chatId) =>
      '$GROUP_CHANNEL.${describeEnum(MessageType.RemoveMessage)}.$chatId';

  String getGroupTextingChannelById(String chatId) =>
      '$GROUP_CHANNEL.${describeEnum(MessageType.Texting)}.$chatId';

  String getInviteUserToJoinChatChannel(int userId) =>
      '$PRIVATE_USER.${describeEnum(MessageType.InviteUserToJoinChat)}.$userId';
  String getGroupChatInfoById(String chatId) =>
      '$GROUP_CHANNEL.${describeEnum(MessageType.UpdateChatInfo)}.$chatId';

  NatsMessage _parseMessage(dataMessage) {
    var payload = (dataMessage as DataMessage).encodedPayload;
    var sequence = dataMessage.sequence;
    var message = NatsMessage.fromBytes(payload);
    message.sequence = sequence;
    return message;
  }

  Future<void> _listenPrivateUserChatIdList(
      {Int64 startSequence = Int64.ZERO}) async {
    await listenChatList(getPrivateUserChatIdList(userId), userChatIdList,
        startSequence: startSequence);
  }

  Future<void> listenChatList(String channel, Set<String> chatIdList,
      {Int64 startSequence = Int64.ZERO}) async {
    var _subscriptionToPublicChannel =
        await _subscribeToChannel(channel, startSequence: startSequence);
    if (_subscriptionToPublicChannel == null) {
      return;
    }
    await for (final dataMessage in _subscriptionToPublicChannel.stream) {
      NatsMessage message = _parseMessage(dataMessage);
      var systemPayload = message.getSystemPayload();
      if (systemPayload.type == MessageType.ChatList) {
        systemPayload.fields.forEach((channel, action) {
          if (action == DELETE_ACTION) {
            chatIdList.remove(channel);
          } else {
            chatIdList.add(channel);
          }
        });
      }

      if (message.needAck) {
        _stan.acknowledge(_subscriptionToPublicChannel, dataMessage);
      }
    }
  }

  Future<void> _unsubscribeByChannel(String channel, {int? sid}) async {
    if (sid == null) {
      sid = getSidByChannelName(channel);
    }

    if (sid != null) {
      //_stan.unsubscribeBySid(sid);
      await Future.delayed(Duration(milliseconds: 800));
    }
  }

  Future<Subscription?> _subscribeToChannel(channel,
      {int? sid, Int64 startSequence = Int64.ZERO}) async {
    var durableName = "$userId-$deviceVirtualId-$channel";

    sid = getSidByChannelName(channel);
    //await _unsubscribeByChannel(channel);
    print(durableName);

    var subscription = startSequence != Int64.ZERO
        ? await _stan.subscribe(
            subject: channel,
            maxInFlight: 1,
            durableName: durableName,
            startSequence: startSequence)
        : await _stan.subscribe(
            subject: channel,
            maxInFlight: 1,
            durableName: durableName,
          );
    return subscription;
  }

  Future<void> _listenBySubscription(
      channel, Subscription? subscription) async {
    if (subscription == null) return;

    await for (final dataMessage in subscription.stream) {
      if (_channelSubscriptions.containsKey(channel)) {
        NatsMessage message = _parseMessage(dataMessage);
        await onMessage(channel, message);
        Future<void> Function(String, NatsMessage) channelCallback =
            _channelCallbacks[channel]!;
        await channelCallback(channel, message);

        if (message.needAck) {
          _stan.acknowledge(subscription, dataMessage);
        }
      } else {
        break;
      }
    }
  }

  int? getSidByChannelName(String channel) =>
      int.parse("${200}${MessageListView.getTypeByChannel(channel)?.index}");

  final Set<String> userChatIdList = {};
  final Set<String> publicChatIdList = {};
  final Map<String, Subscription?> _channelSubscriptions = {};
  Future<void> Function(String, NatsMessage) onMessage =
      (channel, message) async {
    print(message);
  };
  final Map<String, Future<void> Function(String, NatsMessage)>
      _channelCallbacks = {};
}
