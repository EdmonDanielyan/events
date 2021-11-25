import 'package:fixnum/fixnum.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';

class ChatJoinedListener {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  ChatJoinedListener({
    required this.natsProvider,
    required this.userFunctions,
    required this.chatDatabaseCubit,
  });

  NatsListener get natsListener =>
      UseMessageProvider.messageProvider!.natsListener;
  bool isListeningToChannel(String channel) =>
      natsListener.listeningToChannel(channel);

  Future<void> listenTo(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    try {
      if (!isListeningToChannel(channel)) {
        await natsProvider.subscribeToChannel(channel, onMessage,
            startSequence: startSequence);
      }
    } on SubscriptionAlreadyExistException {}
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    if (!isListeningToChannel(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as SystemPayload;
      ChatInvitationFields fields =
          ChatInvitationFields.fromMap(mapPayload.fields);

      final users = fields.users;
      final chat = fields.chat;

      if (users.isNotEmpty) {
        await userFunctions.insertUsers(users);
        await userFunctions.addParticipants(
            ChatUserViewModel.toParticipants(users, chat), chat);
        setMessage(users, chat);
        await UseMessageProvider.messageProvider?.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> setMessage(List<UserTable> users, ChatTable chat) async {
    for (final user in users) {
      final generateMessage = SendMessage.joinedLeftMessage(
        chatId: chat.id,
        userName: user.name,
        type: MessageType.UserJoined,
      );

      if (generateMessage != null) {
        await SendMessage(chatDatabaseCubit: chatDatabaseCubit, chat: chat)
            .addMessage(generateMessage);
      }
    }
  }
}
