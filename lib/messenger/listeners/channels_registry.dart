import 'package:dart_nats_streaming/dart_nats_streaming.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/channel_functions.dart';
import 'package:ink_mobile/messenger/cases/user_functions.dart';
import 'package:ink_mobile/messenger/constants/nats_constants.dart';
import 'package:ink_mobile/messenger/listeners/chat_list.dart';
import 'package:ink_mobile/messenger/listeners/joined.dart';
import 'package:ink_mobile/messenger/listeners/online.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/providers/notifications/push_notification_manager.dart';

import '../../../setup.dart';
import 'message_listener.dart';

@lazySingleton
class ChannelsRegistry with Loggable {
  final NatsProvider natsProvider;
  final ChannelFunctions channelFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;

  final PushNotificationManager pushNotificationManager;

  ChatListListener get chatListListener =>
      listeners[MessageType.ChatList]! as ChatListListener;

  UserOnlineListener get onlineListener {
    final listener = listeners[MessageType.Online] as UserOnlineListener?;

    if (listener != null) return listener;

    return sl.get<MessageListener>(instanceName: "Online")
        as UserOnlineListener;
  }

  ChatJoinedListener get chatJoinedListener =>
      listeners[MessageType.UserJoined]! as ChatJoinedListener;

  final UserFunctions userFunctions;

  Map<MessageType, MessageListener> listeners = {};

  ChannelsRegistry({
    required this.natsProvider,
    required this.channelFunctions,
    required this.userFunctions,
    required this.chatDatabaseCubit,
    required this.pushNotificationManager,
  });

  String lastChannelStr = "";

  Set<MessageType> notStorableTypes = {
    MessageType.Online,
    MessageType.ChatList
  };

  String get inviteUserChannel => natsProvider.getInviteUserToJoinChatChannel();

  void listenToAllMessages() {
    natsProvider.onMessage = (String channelStr, NatsMessage message) async {
      saveChannel(message);
    };
  }

  Future<void> onUnackMessages(
      Subscription subscription, DataMessage message) async {
    final channel = subscription.subject;
    await unSubscribeFromChannel(channel, deleteFromDatabase: false);
    await _subscribeToChannel(
      subscription.subject,
      pushSubscription: false,
      startSequence: message.sequence,
      startPosition: subscription.subscriptionRequest.startPosition,
    );
  }

  Future<void> saveChannel(NatsMessage message) async {
    final payload = message.payload;
    if (payload is Payload && !notStorableTypes.contains(payload.type)) {
      await channelFunctions.saveNatsMessage(message);
    }
  }

  Future<void> init() async {
    logger.finest('init');
    await Future.delayed(Duration(seconds: 1));
    listeners = {};
    MessageType.values.forEach((messageType) {
      var messageListenerToSearch = describeEnum(messageType);
      logger.fine(() =>
          'Looking for listener of message type: $messageListenerToSearch');

      try {
        MessageListener listener =
            sl.get<MessageListener>(instanceName: messageListenerToSearch);
        listeners.putIfAbsent(messageType, () => listener);
      } catch (e) {
        logger.warning(() =>
            'Not found listener for message type: $messageListenerToSearch');
      }
    });
    await onlineListener.subscribeOnline();
    await chatListListener.subscribe(userFunctions.me.id.toString());
    await subscribeToInvitations();

    chatDatabaseCubit.setLoadingChats(false);
    logger.finest('init is finished');
  }

  Future<void> subscribeToInvitations() async {
    logger.finest("subscribeToInvitations");
    final exists = await channelFunctions.channelExists(inviteUserChannel);

    if (!exists) {
      await _subscribeToChannel(inviteUserChannel, pushSubscription: false);
    }
  }

  Future<void> listenToMyStoredChannels() async {
    logger.finest('listenToMyStoredChannels');
    List<ChannelTable> channels = List<ChannelTable>.unmodifiable(
        await channelFunctions.getAllChannels());

    if (channels.isNotEmpty) {
      for (final channel in channels) {
        await _subscribeToChannel(
          channel.id,
          startSequence: getSequence(channel.sequence),
        );
      }
    }
  }

  Int64 getSequence(int sequence) {
    return Int64.fromInts(0, sequence == 0 ? sequence : sequence + 1);
  }

  Future<void> onChannelMessage(String channel, NatsMessage message) async {
    var messageType = (message.payload as Payload).type;
    var listener = listeners[messageType];
    if (listener == null) {
      logger.warning("No listener registered for message type: $messageType");
      return;
    }
    return listener.onMessage(channel, message);
  }

  Future<void> _subscribeToChannel(String channel,
      {pushSubscription = true,
      startSequence = Int64.ZERO,
      startPosition = StartPosition.SequenceStart,
      maxInFlight = MAX_IN_FLIGHTS}) async {
    logger.fine(() => "subscribeToChannel. channel: $channel, startSequence: $startSequence");

    if (!natsProvider.isConnected) {
      logger.warning("nats is not connected");
      return;
    }
    if (!isListening(channel)) {
      var chatId = channel.split(".").last;
      //We ignore await here to speed up channel enumeration
      if (pushSubscription) {
        var isPushNeed = ((await chatDatabaseCubit.db.selectChatById(chatId))
                ?.notificationsOn) ??
            true;
        if (isPushNeed) {
          pushNotificationManager.subscribeToTopic(channel);
        } else {
          pushNotificationManager.unsubscribeFromTopic(channel);
        }
      }

      try {
        await natsProvider.subscribeToChannel(channel, onChannelMessage,
            ackWaitSeconds: ACK_WAITS_SECONDS,
            startPosition: startPosition,
            maxInFlight: maxInFlight,
            startSequence: startSequence);
      } catch (_e, stacktrace) {
        logger.severe("Unexpected error", _e, stacktrace);
      }
    } else
    {
      logger.warning("Already listening");
    }
  }

  Future<void> unSubscribeFromChannel(String channel,
      {bool deleteFromDatabase = true}) async {
    logger.finest(() => "unSubscribeFromChannel: $channel");
    await natsProvider.unsubscribeFromChannel(channel);
    if (channel.contains("Text")) {
      await pushNotificationManager.unsubscribeFromTopic(channel);
    }
    if (deleteFromDatabase) {
      await channelFunctions.deleteChannel(channel);
    }
  }

  Future<void> subscribeOnChatChannels(String channel) async {
    logger.finest(() => "subscribeOnChatChannels: $channel");
    if (!chatListListener.busyChannels.contains(channel)) {
      await channelFunctions.saveByChannelName(channel);
    }
    await listenToMyStoredChannels();
  }

  Future<void> subscribeOnChatChannelsIfNotExists(String chatChannel,
      {Int64 sequence = Int64.ZERO}) async {
    logger.finest(() => "subscribeOnChatChannelsIfNotExists. channel: $chatChannel, sequence: $sequence");

    final channelExists = await channelFunctions.getChannel(chatChannel);
    if (channelExists == null) {
      final channelTable = await channelFunctions.saveByChannelName(chatChannel,
          sequence: sequence);
      if (channelTable != null) {
        await _subscribeToChannel(channelTable.id, startSequence: sequence);
      }
    } else {
      await _subscribeToChannel(channelExists.id,
          startSequence: getSequence(channelExists.sequence));
    }
  }

  Future<void> unSubscribeOnChatDelete(String chatChannel) async {
    logger.finest(() => "unSubscribeOnChatDelete: $chatChannel");
    await unSubscribeFromChannel(chatChannel);
  }

  bool isListening(String channel) => natsProvider.channelSubscriptions.containsKey(channel);

  Future<void> unsubscribeFromAll({required bool includePush}) async {
    logger.finest("unsubscribeFromAll");
    var channels = natsProvider.channelSubscriptions.keys.toList();
    channels.forEach((channel) async {
      await natsProvider.unsubscribeFromChannel(channel);
      if (includePush) {
        pushNotificationManager.unsubscribeFromTopic(channel);
      }
    });
  }
}
