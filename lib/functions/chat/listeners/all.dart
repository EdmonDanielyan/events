import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/chat.dart';
import 'package:ink_mobile/functions/chat/listeners/delete_message.dart';
import 'package:ink_mobile/functions/chat/listeners/joined.dart';
import 'package:ink_mobile/functions/chat/listeners/left.dart';
import 'package:ink_mobile/functions/chat/listeners/message_status.dart';
import 'package:ink_mobile/functions/chat/listeners/texting.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:fixnum/fixnum.dart';

import 'invitation.dart';

class NatsListener {
  final NatsProvider natsProvider;
  final ChannelFunctions channelFunctions;
  final ChatMessageListener chatMessageListener;
  final ChatInvitationListener chatInvitationListener;
  final MessageStatusListener messageStatusListener;
  final MessageTextingListener messageTextingListener;
  final ChatJoinedListener chatJoinedListener;
  final ChatLeftListener chatLeftListener;
  final MessageDeletedListener messageDeletedListener;
  NatsListener({
    required this.natsProvider,
    required this.channelFunctions,
    required this.chatMessageListener,
    required this.chatInvitationListener,
    required this.messageStatusListener,
    required this.messageTextingListener,
    required this.chatJoinedListener,
    required this.chatLeftListener,
    required this.messageDeletedListener,
  });

  String lastChannelStr = "";
  List<String> subscribedChannels = [];

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

  List<String> getLinkedChannelsById(String chatId) {
    List<String> channels = [];
    channels.add(textChannel(chatId));
    channels.add(removeMessageChannel(chatId));
    channels.add(readChannel(chatId));
    channels.add(textingChannel(chatId));
    channels.add(joinedChannel(chatId));
    channels.add(leftChannel(chatId));
    return channels;
  }

  String get _inviteUserChannel =>
      natsProvider.getInviteUserToJoinChatChannel(JwtPayload.myId);

  Future<void> listenToAllMessages() async {
    natsProvider.onMessage = (String channelStr, NatsMessage message) async {
      channelFunctions.saveNatsMessage(message);
    };
  }

  Future<void> init() async {
    _listenToInvitations();
    listenToMyStoredChannels();
  }

  Future<void> _listenToInvitations() async {
    final exists = await channelFunctions.channelExists(_inviteUserChannel);

    if (!exists) {
      _subscribeToChannel(MessageType.InviteUserToJoinChat, _inviteUserChannel);
    }
  }

  Future<void> listenToMyStoredChannels() async {
    List<ChannelTable> channels = await channelFunctions.getAllChannels();
    if (channels.isNotEmpty) {
      for (final channel in channels) {
        Int64 currentSeq = Int64.parseInt(channel.sequence).toInt64();
        Int64 sequence = currentSeq == 0 ? currentSeq : currentSeq + 1;
        await _subscribeToChannel(channel.messageType, channel.to,
            startSequence: sequence);
      }
    }
  }

  Future<void> _subscribeToChannel(MessageType type, String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    if (!listeningToChannel(channel)) {
      if (type == MessageType.Text) {
        chatMessageListener.listenTo(channel, startSequence: startSequence);
      } else if (type == MessageType.RemoveMessage) {
        messageDeletedListener.listenTo(channel, startSequence: startSequence);
      } else if (type == MessageType.UserReacted) {
        messageStatusListener.listenTo(channel, startSequence: startSequence);
      } else if (type == MessageType.Texting) {
        messageTextingListener.listenTo(channel, startSequence: startSequence);
      } else if (type == MessageType.UserJoined) {
        chatJoinedListener.listenTo(channel, startSequence: startSequence);
      } else if (type == MessageType.UserLeftChat) {
        chatLeftListener.listenTo(channel, startSequence: startSequence);
      } else if (type == MessageType.InviteUserToJoinChat) {
        chatInvitationListener.listenTo(channel, startSequence: startSequence);
      }

      subscribedChannels.add(channel);
    }
  }

  Future<void> _unSubscribeFromChannel(String channel) async {
    natsProvider.unsubscribeFromChannel(channel);
    if (listeningToChannel(channel)) {
      subscribedChannels.remove(channel);
    }
    channelFunctions.deleteChannel(channel);
  }

  Future<void> subscribeOnChatCreate(String chatId) async {
    final getChannels = getLinkedChannelsById(chatId);

    if (getChannels.isNotEmpty) {
      for (final channel in getChannels) {
        await channelFunctions.saveByChannelName(channel);
      }
      listenToMyStoredChannels();
    }
  }

  Future<void> unSubscribeOnChatDelete(String chatId) async {
    final getChannels = getLinkedChannelsById(chatId);

    if (getChannels.isNotEmpty) {
      for (final channel in getChannels) {
        await _unSubscribeFromChannel(channel);
      }
    }
  }

  bool listeningToChannel(String channel) =>
      subscribedChannels.contains(channel);
}
