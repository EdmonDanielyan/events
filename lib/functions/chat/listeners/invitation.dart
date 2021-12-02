import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/sender/message_sender.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import 'all.dart';

@injectable
class ChatInvitationListener {
  final NatsProvider natsProvider;
  final MessageSender messageSender;
  final ChatDatabaseCubit chatDatabaseCubit;

  ChatInvitationListener(this.natsProvider, this.messageSender, this.chatDatabaseCubit);

  NatsListener get natsListener {
    if (!natsProvider.isConnected) {
      throw NoConnectionException();
    }
    return UseMessageProvider.messageProvider!.natsListener;
  }

  bool isListeningToChannel(String channel) =>
      natsListener.listeningToChannel(channel);

  Future<void> listenTo(
    String channel, {
    Int64 startSequence = Int64.ZERO,
  }) async {
    if (!isListeningToChannel(channel)) {
      await natsProvider.subscribeToChannel(
        channel,
        onMessage,
        startSequence: startSequence,
      );
    }
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    if (!isListeningToChannel(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as SystemPayload;
      ChatInvitationFields fields =
          ChatInvitationFields.fromMap(mapPayload.fields);
      late ChatTable chat =
          ChatListView.changeChatForParticipant(fields.chat, fields.users);

      await ChatCreation(chatDatabaseCubit)
          .createDynamically(chat, fields.users);
      await UseMessageProvider.messageProvider?.chatSaver.saveChats(newChat: chat);

      _chatLinkedListeners(chat.id);
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> _chatLinkedListeners(String chatId) async {
    natsListener.subscribeOnChatCreate(chatId);
  }

  Future<void> sendInvitations(ChatTable chat, List<UserTable> users) async {
    for (final user in users) {
      if (user.id != JwtPayload.myId) {
        await messageSender.inviteUser(
          user: user,
          chat: chat,
          chatChannel: natsProvider.getGroupTextChannelById(chat.id),
          users: users,
        );
      }
    }
  }
}
