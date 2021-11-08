import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/listeners/chat.dart';
import 'package:ink_mobile/functions/chat/sender/send_system_message.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:fixnum/fixnum.dart';

import 'all.dart';

class ChatInvitationListener {
  final NatsProvider natsProvider;
  final ChatMessageListener chatMessageListener;
  final ChatSendMessage chatSendMessage;
  final ChatDatabaseCubit chatDatabaseCubit;

  ChatInvitationListener({
    required this.chatMessageListener,
    required this.natsProvider,
    required this.chatSendMessage,
    required this.chatDatabaseCubit,
  });

  late final NatsListener _natsListener;

  void init(NatsListener natsListener) {
    _natsListener = natsListener;
  }

  Future<void> listenTo(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    print("LISTENING TO ${channel} WITH SEQUENCE $startSequence");
    await natsProvider.subscribeToChannel(channel, onMessage,
        startSequence: startSequence);
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    print("ON INVITATION TRIGGERED");
    final mapPayload = message.payload! as SystemPayload;
    ChatInvitationFields fields =
        ChatInvitationFields.fromMap(mapPayload.fields);
    late ChatTable chat =
        ChatListView.changeChatForParticipant(fields.chat, fields.users);
    if (!_natsListener.listeningToChannel(fields.channel)) {
      chatMessageListener.listenTo(fields.channel);
    }
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
