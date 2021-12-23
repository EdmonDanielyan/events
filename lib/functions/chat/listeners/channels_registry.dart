import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/chat_list.dart';
import 'package:ink_mobile/functions/chat/listeners/online.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../../../setup.dart';
import 'channel_listener.dart';

@lazySingleton
class ChannelsRegistry with Loggable {
  final NatsProvider natsProvider;
  final ChannelFunctions channelFunctions;

  ChatListListener get chatListListener =>
      listeners[MessageType.ChatList]! as ChatListListener;

  UserOnlineListener get userOnlineListener =>
      listeners[MessageType.Online]! as UserOnlineListener;

  final UserFunctions userFunctions;

  Map<MessageType, ChannelListener> listeners = {};

  ChannelsRegistry(
      {required this.natsProvider,
      required this.channelFunctions,
      required this.userFunctions});

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
    channels.add(textChannel(chatId));
    channels.add(removeMessageChannel(chatId));
    channels.add(readChannel(chatId));
    //channels.add(textingChannel(chatId));
    channels.add(joinedChannel(chatId));
    channels.add(leftChannel(chatId));
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
      logger.fine(
          'Looking for listener of message type: $messageListenerToSearch');

      try {
        ChannelListener listener =
            sl.get<ChannelListener>(instanceName: messageListenerToSearch);
        listeners.putIfAbsent(messageType, () => listener);
      } catch (e) {
        logger.warning(
            'Not found listener for message type: $messageListenerToSearch');
      }
    });
    await chatListListener.subscribe(userFunctions.me.id.toString());
    await _listenToInvitations();
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
    logger.fine("_subscribeToChannel: $type, $channel, $startSequence");
    if (!natsProvider.isConnected) {
      logger.warning("nats is not connected");
      return;
    }

    if (!isListening(channel)) {
      logger.fine("listeners[$type]=${listeners[type]}");
      try {
        await listeners[type]!.onListen(channel, startSequence: startSequence);
        listeningChannels.add(channel);
      } catch (_e, stacktrace) {
        logger.severe("Unexpected error", _e, stacktrace);
      }
    }
  }

  Future<void> unSubscribeFromChannel(String channel) async {
    logger.finest("unSubscribeFromChannel: $channel");
    natsProvider.unsubscribeFromChannel(channel);
    if (isListening(channel)) {
      listeningChannels.remove(channel);
    }
    channelFunctions.deleteChannel(channel);
  }

  Future<void> subscribeOnChatChannels(String chatId) async {
    logger.finest("subscribeOnChatChannels: $chatId");
    final getChannels = getLinkedChannelsById(chatId);

    if (getChannels.isNotEmpty) {
      for (final channel in getChannels) {
        if (!ChatListListener.busyChannels.contains(channel)) {
          await channelFunctions.saveByChannelName(channel);
        }
      }
      await listenToMyStoredChannels();
    }
  }

  Future<void> subscribeOnChatChannelsIfNotExists(String chatId) async {
    logger.finest("subscribeOnChatChannelsIfNotExists: $chatId");
    final getChannels = getLinkedChannelsById(chatId);

    if (getChannels.isNotEmpty) {
      for (final channel in getChannels) {
        final channelExists = await channelFunctions.getChannel(channel);
        if (channelExists == null) {
          final channelTable =
              await channelFunctions.saveByChannelName(channel);
          if (channelTable != null) {
            await _subscribeToChannel(
                channelTable.messageType, channelTable.to);
          }
        } else {
          await _subscribeToChannel(channelExists.messageType, channelExists.to,
              startSequence: strToSequence(channelExists.sequence));
        }
      }
    }
  }

  Future<void> unSubscribeOnChatDelete(String chatId) async {
    logger.finest("unSubscribeOnChatDelete: $chatId");
    final getChannels = getLinkedChannelsById(chatId);

    if (getChannels.isNotEmpty) {
      for (final channel in getChannels) {
        await unSubscribeFromChannel(channel);
      }
    }
  }

  bool isListening(String channel) => listeningChannels.contains(channel);

  void unsubscribeFromAll() {
    logger.finest("unsubscribeFromAll");
    listeningChannels.forEach((element) {
      natsProvider.unsubscribeFromChannel(element);
    });

    listeningChannels.clear();
  }
}
