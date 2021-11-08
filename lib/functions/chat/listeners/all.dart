import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/chat.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:fixnum/fixnum.dart';

import 'invitation.dart';

class NatsListener {
  final NatsProvider natsProvider;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChannelFunctions channelFunctions;
  final ChatMessageListener chatMessageListener;
  final ChatInvitationListener chatInvitationListener;
  NatsListener({
    required this.natsProvider,
    required this.chatDatabaseCubit,
    required this.channelFunctions,
    required this.chatMessageListener,
    required this.chatInvitationListener,
  });

  String lastChannelStr = "";
  List<String> subscribedChannels = [];

  String get _inviteUserChannel =>
      natsProvider.getInviteUserToJoinChatChannel(JwtPayload.myId);

  Future<void> listenToAllMessages() async {
    natsProvider.onMessage = (String channelStr, NatsMessage message) async {
      print("LISTENING TO ALL MESSAGES");
      channelFunctions.saveNatsMessage(message);
    };
  }

  Future<void> init() async {
    chatInvitationListener.init(this);
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
        print("CHANNEL ${channel.to} WITH SEQUENCE ${channel.sequence}");
        Int64 sequence = Int64.parseInt(channel.sequence).toInt64() + 1;
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
      } else if (type == MessageType.InviteUserToJoinChat) {
        chatInvitationListener.listenTo(channel, startSequence: startSequence);
      }

      subscribedChannels.add(channel);
    }
  }

  bool listeningToChannel(String channel) =>
      subscribedChannels.contains(channel);
}
