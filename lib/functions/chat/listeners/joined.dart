import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/sender/chat_saver.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';
import 'channels_registry.dart';

@Named("UserJoined")
@Injectable(as: ChannelListener)
class ChatJoinedListener extends ChannelListener {
  final ChatFunctions chatFunctions;
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatSaver chatSaver;
  final InviteSender messageSender;

  ChatJoinedListener(
      NatsProvider natsProvider,
      ChannelsRegistry registry,
      this.userFunctions,
      this.chatDatabaseCubit,
      this.messageSender,
      this.chatSaver,
      this.chatFunctions)
      : super(natsProvider, registry);

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
    if (!registry.isListening(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as SystemPayload;
      ChatInvitationFields fields =
          ChatInvitationFields.fromMap(mapPayload.fields);

      final users = fields.users;
      final chat = fields.chat;

      if (users.isNotEmpty) {
        registry.joinedChats.add(chat);
        await userFunctions.insertMultipleUsers(users);
        await userFunctions.insertMultipleParticipants(
            ChatUserViewModel.toParticipants(users, chat));
        await setMessage(users, chat, message);
        await chatSaver.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> setMessage(
      List<UserTable> users, ChatTable chat, NatsMessage message) async {
    for (final user in users) {
      final generateMessage = GetIt.I<SendMessage>().joinedLeftMessage(
        chatId: chat.id,
        userName: user.name,
        type: MessageType.UserJoined,
        createdUtc: message.serverTime,
        userId: user.id,
      );

      if (generateMessage != null) {
        await GetIt.I<SendMessage>()
            .addMessage(chat, generateMessage, setChatToFirst: true);
      }
    }
  }
}
