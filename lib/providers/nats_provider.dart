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
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';

// ignore: implementation_imports
import 'package:dart_nats_streaming/src/protocol.dart';
import 'package:logging/logging.dart';

import '../app.dart';
import '../setup.dart';
import 'message_provider.dart';

const PUBLIC_CHATS = 'ink.messaging.public';
const GROUP_CHANNEL = 'ink.messaging.group';
const PRIVATE_USER = 'ink.messaging.private';
const DELETE_ACTION = 'delete';

@lazySingleton
class NatsProvider {
  static final _logger = Logger('NatsProvider');

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
      _connected();
    });
    _stan.onDisconnect(function: () {
      _disconnected();
    });
    var connected = await _connect();
    if (!connected) {
      throw NoConnectionException();
    }

    _connectMessageProvider();

    return true;
  }

  void _connected() {
    _logger.info('Stan connected..');

    _connectMessageProvider();

    if (App.getContext != null) {
      SuccessCustomSnackbar(
        context: App.getContext!,
        txt: localizationInstance.connectedToServer,
      );
    }
  }

  void _disconnected() {
    _logger.info('Stan disconnected..');

    if (App.getContext != null) {
      SimpleCustomSnackbar(
        context: App.getContext!,
        txt: localizationInstance.disconnectedFromServer,
      );
    }
  }

  void _connectMessageProvider() {
    if (!UseMessageProvider.initialized) {
      UseMessageProvider.initMessageProvider(this, sl<ChatDatabaseCubit>());
      UseMessageProvider.messageProvider?.init();
    }
  }

  Future<void> dispose() async {
    userChatIdList.clear();
    publicChatIdList.clear();
    await _stan.manualDisconnect();
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
  Future<bool> subscribeToChannel(
    String channel,
    Future<void> Function(String, NatsMessage) onMessageFuture, {
    Int64 startSequence = Int64.ZERO,
    StartPosition? startPosition,
  }) async {
    if (!_channelSubscriptions.containsKey(channel)) {
      var subscription = await _subscribeToChannel(channel,
          startPosition: startPosition, startSequence: startSequence);

      _listenBySubscription(channel, subscription);
      _channelSubscriptions[channel] = subscription;
      _channelCallbacks[channel] = onMessageFuture;

      if (subscription != null) {
        _logger.info('_channelSubscriptions: ${_channelSubscriptions.keys}');
        return true;
      }
      return false;
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

    _logger.info('_channelSubscriptions: ${_channelSubscriptions.keys}');
  }

  //////////////////////////////// NATS Protocol ///////////////////////////////

  Future<bool> _connect() async {
    var natsCert = await rootBundle.load(natsCertPath);
    var _certificate = natsCert.buffer.asUint8List();
    var connectResult = await _stan.connectUri(Uri.parse(natsWssUrl),
        certificate: _certificate,
        clusterID: natsCluster,
        pingMaxAttempts: 10,
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

  String getUserOnlineChannel(int userId) =>
      '$PRIVATE_USER.${describeEnum(MessageType.Online)}.$userId';

  NatsMessage parseMessage(dataMessage) {
    var payload = (dataMessage as DataMessage).encodedPayload;
    var sequence = dataMessage.sequence;
    var message = NatsMessage.fromBytes(payload);
    message.sequence = sequence;
    return message;
  }

  Future<Subscription?> listenChatList(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    var _subscriptionToPublicChannel = await _subscribeToChannel(channel,
        startPosition: StartPosition.LastReceived);

    return _subscriptionToPublicChannel;
  }

  Future<Subscription?> _subscribeToChannel(channel,
      {StartPosition? startPosition, Int64 startSequence = Int64.ZERO}) async {
    var durableName = "$userId-$deviceVirtualId-$channel";

    var subscription = await _stan.subscribe(
      subject: channel,
      maxInFlight: 1,
      startPosition: startPosition ?? _getPosition(channel),
      durableName: durableName,
      startSequence: startSequence,
    );

    return subscription;
  }

  StartPosition _getPosition(String channel) {
    final msgType = MessageListView.getTypeByChannel(channel);

    if (msgType != null) {
      if (_startSeqTypes.contains(msgType)) return StartPosition.SequenceStart;

      if (_lastReceivedType.contains(msgType))
        return StartPosition.LastReceived;
    }

    return StartPosition.NewOnly;
  }

  Future<void> _listenBySubscription(
      channel, Subscription? subscription) async {
    if (subscription == null) return;

    await for (final dataMessage in subscription.stream) {
      if (_channelSubscriptions.containsKey(channel)) {
        NatsMessage message = parseMessage(dataMessage);
        if (message.needAck) {
          acknowledge(subscription, dataMessage);
        }

        if (!dataMessage.isRedelivery) {
          await onMessage(channel, message);
          Future<void> Function(String, NatsMessage) channelCallback =
              _channelCallbacks[channel]!;
          await channelCallback(channel, message);
        }
      } else {
        break;
      }
    }
  }

  void acknowledge(Subscription subscription, DataMessage message) {
    _stan.acknowledge(subscription, message);
  }

  final Set<String> userChatIdList = {};
  final Set<String> publicChatIdList = {};
  final Map<String, Subscription?> _channelSubscriptions = {};
  final Set<MessageType> _lastReceivedType = {
    MessageType.UpdateChatInfo,
    MessageType.ChatList,
  };
  final Set<MessageType> _startSeqTypes = {
    MessageType.InviteUserToJoinChat,
    MessageType.UserJoined,
    MessageType.UserLeftChat,
    MessageType.Text,
    MessageType.Document,
    MessageType.RemoveMessage,
  };
  Future<void> Function(String, NatsMessage) onMessage =
      (channel, message) async {
    _logger.info(message);
  };
  final Map<String, Future<void> Function(String, NatsMessage)>
      _channelCallbacks = {};

  bool get isConnected => _stan.connected;
}
