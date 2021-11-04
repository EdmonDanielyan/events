import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/chat.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

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

  Future<void> listenToAllMessages() async {
    natsProvider.onMessage = (String channelStr, NatsMessage message) async {
      print(channelStr);
      print(message);

      _hideRepeats(message, () {
        print("LISTENING TO ALL MESSAGES");
        channelFunctions.saveNatsMessage(message);
      });
    };
  }

  Future<void> listenToMyChannels() async {
    _listenToInvitations();
    _listenToMyStoredChannels();
  }

  Future<void> _listenToInvitations() async {
    String channel =
        natsProvider.getInviteUserToJoinChatChannel(JwtPayload.myId);
    _subscribeToChannel(MessageType.InviteUserToJoinChat, channel);
  }

  Future<void> _listenToMyStoredChannels() async {
    List<ChannelTable> channels = await channelFunctions.getAllChannels();
    if (channels.isNotEmpty) {
      for (final channel in channels) {
        _subscribeToChannel(channel.messageType, channel.to);
      }
    }
  }

  Future<void> _subscribeToChannel(MessageType type, String channel) async {
    if (!subscribedChannels.contains(channel)) {
      if (type == MessageType.Text) {
        chatMessageListener.listenTo(channel);
      } else if (type == MessageType.InviteUserToJoinChat) {
        chatInvitationListener.listenTo(channel);
      }

      subscribedChannels.add(channel);
    }
  }

  void _hideRepeats(NatsMessage message, Function() callback) {
    bool notPreviousOne = lastChannelStr != message.to;
    if (notPreviousOne) {
      callback();
    }

    lastChannelStr = message.to;
  }
}
