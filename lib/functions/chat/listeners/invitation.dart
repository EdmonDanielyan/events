import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/sender/send_system_message.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:fixnum/fixnum.dart';

import 'all.dart';

class ChatInvitationListener {
  final NatsProvider natsProvider;
  final ChatSendMessage chatSendMessage;
  final ChatDatabaseCubit chatDatabaseCubit;

  ChatInvitationListener({
    required this.natsProvider,
    required this.chatSendMessage,
    required this.chatDatabaseCubit,
  });
  NatsListener get natsListener =>
      UseMessageProvider.messageProvider.natsListener;

  Future<void> listenTo(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    if (!natsListener.listeningToChannel(channel)) {
      await natsProvider.subscribeToChannel(channel, onMessage,
          startSequence: startSequence);
    }
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    final mapPayload = message.payload! as SystemPayload;
    ChatInvitationFields fields =
        ChatInvitationFields.fromMap(mapPayload.fields);
    late ChatTable chat =
        ChatListView.changeChatForParticipant(fields.chat, fields.users);
    UseMessageProvider.messageProvider.messagesListeners(chat);
    await chatSendMessage.saveToPrivateUserChatIdList(
        userId: JwtPayload.myId, channel: channel, chat: chat);

    await ChatCreation(chatDatabaseCubit).createDynamically(chat, fields.users);
  }

  Future<void> inviteUser({
    required UserTable user,
    required ChatTable chat,
    required List<UserTable> users,
    required String chatChannel,
  }) async {
    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getInviteUserToJoinChatChannel(user.id),
      MessageType.InviteUserToJoinChat,
      ChatInvitationFields(
        channel: chatChannel,
        chat: chat,
        users: users,
      ).toMap(),
    );
  }
}
