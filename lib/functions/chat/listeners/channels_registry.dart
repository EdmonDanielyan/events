import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/chat_list.dart';
import 'package:ink_mobile/functions/chat/listeners/joined.dart';
import 'package:ink_mobile/functions/chat/listeners/online.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:ink_mobile/providers/push_notification_manager.dart';

import '../../../setup.dart';
import 'channel_listener.dart';

@lazySingleton
class ChannelsRegistry with Loggable {
  final NatsProvider natsProvider;
  final ChannelFunctions channelFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;

  final PushNotificationManager pushNotificationManager;

  final List<ChatTable> joinedChats = [];

  ChatListListener get chatListListener =>
      listeners[MessageType.ChatList]! as ChatListListener;

  UserOnlineListener get onlineListener {
    final listener = listeners[MessageType.Online] as UserOnlineListener?;

    if (listener != null) return listener;

    return UserOnlineListener(
        natsProvider, this, userFunctions, chatDatabaseCubit);
  }

  ChatJoinedListener get chatJoinedListener =>
      listeners[MessageType.UserJoined]! as ChatJoinedListener;

  final UserFunctions userFunctions;

  Map<MessageType, ChannelListener> listeners = {};

  ChannelsRegistry({
    required this.natsProvider,
    required this.channelFunctions,
    required this.userFunctions,
    required this.chatDatabaseCubit,
    required this.pushNotificationManager,
  });

  String lastChannelStr = "";
  Set<String> listeningChannels = {};

  String textChannel(String chatId) =>
      natsProvider.getGroupTextChannelById(chatId);

  String removeMessageChannel(String chatId) =>
      natsProvider.getGroupDeleteMessageChannelById(chatId);

  String readChannel(String chatId) =>
      natsProvider.getGroupReactedChannelById(chatId);

  String textingChannel(String chatId) =>
      natsProvider.getGroupTextingChannelById(chatId);

  String joinedChannel(String chatId) =>
      natsProvider.getGroupJoinedChannelById(chatId);

  String leftChannel(String chatId) =>
      natsProvider.getGroupLeftChannelById(chatId);

  String chatInfo(String chatId) => natsProvider.getGroupChatInfoById(chatId);

  List<String> getLinkedChannelsById(String chatId) {
    List<String> channels = [];
    channels.add(joinedChannel(chatId));
    channels.add(leftChannel(chatId));
    channels.add(textChannel(chatId));
    channels.add(removeMessageChannel(chatId));
    channels.add(readChannel(chatId));
    //channels.add(textingChannel(chatId));
    channels.add(chatInfo(chatId));
    return channels;
  }

  Set<MessageType> notStorableTypes = {
    MessageType.Online,
    MessageType.ChatList
  };

  String get inviteUserChannel =>
      natsProvider.getInviteUserToJoinChatChannel(JwtPayload.myId);

  void listenToAllMessages() {
    natsProvider.onMessage = (String channelStr, NatsMessage message) async {
      saveChannel(message);
    };
  }

  Future<void> saveChannel(NatsMessage message) async {
    final payload = message.payload as SystemPayload;
    if (!notStorableTypes.contains(payload.type)) {
      await channelFunctions.saveNatsMessage(message);
    }
  }

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 1));
    logger.finest('init');
    listeners.clear();
    MessageType.values.forEach((messageType) {
      var messageListenerToSearch = describeEnum(messageType);
      logger.fine(() =>
          'Looking for listener of message type: $messageListenerToSearch');

      try {
        ChannelListener listener =
            sl.get<ChannelListener>(instanceName: messageListenerToSearch);
        listeners.putIfAbsent(messageType, () => listener);
      } catch (e) {
        logger.warning(() =>
            'Not found listener for message type: $messageListenerToSearch');
      }
    });
    chatDatabaseCubit.setLoadingChats(true);
    await onlineListener.subscribeOnline();
    await chatListListener.subscribe(userFunctions.me.id.toString());
    await _listenToInvitations();

    chatDatabaseCubit.setLoadingChats(false);
  }

  Future<void> _listenToInvitations() async {
    final exists = await channelFunctions.channelExists(inviteUserChannel);

    if (!exists) {
      await _subscribeToChannel(
          MessageType.InviteUserToJoinChat, inviteUserChannel);
    }
  }

  Future<void> listenToMyStoredChannels() async {
    logger.finest('listenToMyStoredChannels');
    List<ChannelTable> channels = List<ChannelTable>.unmodifiable(
        await channelFunctions.getAllChannels());
    // List<ChannelTable> channels = await channelFunctions.getAllChannels();

    if (channels.isNotEmpty) {
      for (final channel in channels) {
        Int64 sequence = strToSequence(channel.sequence);
        await _subscribeToChannel(
          channel.messageType,
          channel.to,
          startSequence: sequence,
        );
      }
    }
  }

  Int64 strToSequence(String sequence) {
    Int64 currentSeq = Int64.parseInt(sequence).toInt64();
    return currentSeq == 0 ? currentSeq : currentSeq + 1;
  }

  Future<void> _subscribeToChannel(MessageType type, String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    logger.fine(() => "_subscribeToChannel: $type, $channel, $startSequence");

    if (!natsProvider.isConnected) {
      logger.warning("nats is not connected");
      return;
    }

    if (!isListening(channel)) {
      var chatId = channel.split(".").last;
      if (type == MessageType.Text) {
        //We ignore await here to speed up channel enumeration
        var isPushNeed = ((await chatDatabaseCubit.db.selectChatById(chatId))
            ?.notificationsOn) ??
            true;
        if (isPushNeed) {
          pushNotificationManager.subscribeToTopic(channel);
        } else {
          pushNotificationManager.unsubscribeFromTopic(channel);
        }
      }
      logger.fine(() => "listeners[$type]=${listeners[type]}");
      try {
        await listeners[type]!.onListen(channel, startSequence: startSequence);
        listeningChannels.add(channel);
      } catch (_e, stacktrace) {
        logger.severe("Unexpected error", _e, stacktrace);
      }
    }
  }

  Future<void> unSubscribeFromChannel(String channel) async {
    logger.finest(() => "unSubscribeFromChannel: $channel");
    natsProvider.unsubscribeFromChannel(channel);
    if (isListening(channel)) {
      listeningChannels.remove(channel);
    }
    if (channel.contains("Text")) {
      pushNotificationManager.unsubscribeFromTopic(channel);
    }
    channelFunctions.deleteChannel(channel);
  }

  Future<void> subscribeOnChatChannels(String chatId) async {
    logger.finest(() => "subscribeOnChatChannels: $chatId");
    _chatCleaner(chatId);

    final getChannels = getLinkedChannelsById(chatId);

    if (getChannels.isNotEmpty) {
      for (final channel in getChannels) {
        if (!chatListListener.busyChannels.contains(channel)) {
          await channelFunctions.saveByChannelName(channel);
        }
      }
      await listenToMyStoredChannels();
    }
  }

  Future<void> subscribeOnChatChannelsIfNotExists(String chatId,
      {Int64 sequence = Int64.ZERO}) async {
    logger.finest(() => "subscribeOnChatChannelsIfNotExists: $chatId");
    _chatCleaner(chatId);
    final getChannels = getLinkedChannelsById(chatId);

    if (getChannels.isNotEmpty) {
      for (final channel in getChannels) {
        final channelExists = await channelFunctions.getChannel(channel);
        if (channelExists == null) {
          final channelTable = await channelFunctions.saveByChannelName(channel,
              sequence: sequence);
          if (channelTable != null) {
            await _subscribeToChannel(channelTable.messageType, channelTable.to,
                startSequence: sequence);
          }
        } else {
          await _subscribeToChannel(channelExists.messageType, channelExists.to,
              startSequence: strToSequence(channelExists.sequence));
        }
      }
    }
  }

  Future<void> unSubscribeOnChatDelete(String chatId) async {
    logger.finest(() => "unSubscribeOnChatDelete: $chatId");
    final getChannels = getLinkedChannelsById(chatId);

    if (getChannels.isNotEmpty) {
      for (final channel in getChannels) {
        await unSubscribeFromChannel(channel);
      }
    }
  }

  bool isListening(String channel) => listeningChannels.contains(channel);

  void addToListeningChannels(String channel) {
    if (!listeningChannels.contains(channel)) {
      listeningChannels.add(channel);
    }
  }

  void unsubscribeFromAll({required bool includePush}) {
    logger.finest("unsubscribeFromAll");
    listeningChannels.forEach((channel) {
      natsProvider.unsubscribeFromChannel(channel);
      if (includePush && channel.contains("Text")) {
        pushNotificationManager.unsubscribeFromTopic(channel);
      }
    });
    onlineListener.clear();
    listeningChannels.clear();
  }

  void _chatCleaner(String chatId) {
    joinedChats..removeWhere((element) => element.id == chatId);
  }
}
