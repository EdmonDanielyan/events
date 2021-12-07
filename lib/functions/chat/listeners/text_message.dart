import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/sender/chat_saver.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats/message.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:ink_mobile/providers/notifications.dart';

import '../chat_functions.dart';
import 'channels_registry.dart';

@Named("Text")
@Injectable(as: ChannelListener)
class TextMessageListener extends ChannelListener {
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final InviteSender messageSender;

  final ChatFunctions chatFunctions;

  final ChatSaver chatSaver;

  const TextMessageListener(
      NatsProvider natsProvider,
      ChannelsRegistry registry,
      this.userFunctions,
      this.chatDatabaseCubit,
      this.messageSender,
      this.chatFunctions,
      this.chatSaver)
      : super(natsProvider, registry);

  Debouncer get _debouncer => Debouncer(milliseconds: 400);

  @override
  Future<void> onMessage(String channel, NatsMessage message) async {
    if (!registry.isListening(channel)) {
      return;
    }
    try {
      final mapPayload = message.payload! as SystemPayload;

      ChatMessageFields fields = ChatMessageFields.fromMap(mapPayload.fields);
      final newMessage = fields.message.copyWith(
        created: message.createdAt,
        status: (fields.message.status == MessageStatus.SENDING ||
                fields.message.status == MessageStatus.ERROR)
            ? MessageStatus.SENT
            : fields.message.status,
      );

      if (fields.user.id == JwtPayload.myId) {
        chatDatabaseCubit.db.updateMessageById(newMessage.id, newMessage);
      } else {
        ChatTable? myChat =
            await chatDatabaseCubit.db.selectChatById(fields.chat.id);

        final chat = myChat ??
            ChatListView.changeChatForParticipant(fields.chat, [fields.user]);

        _debouncer.run(() {
          _pushNotification(
              chatId: chat.id,
              myChat: myChat,
              message: newMessage,
              user: fields.user);
        });

        await userFunctions.insertUser(fields.user);
        await SendMessage(chatDatabaseCubit: chatDatabaseCubit, chat: chat)
            .addMessage(newMessage);
        await chatSaver.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> _pushNotification(
      {required String chatId,
      required ChatTable? myChat,
      required UserTable user,
      required MessageTable message}) async {
    bool showNotification = true;

    final selectedChat = chatDatabaseCubit.selectedChat;

    if (myChat != null && !myChat.notificationsOn!) {
      showNotification = false;
    }

    if (selectedChat != null && selectedChat.id == chatId) {
      showNotification = false;
    }

    if (showNotification) {
      NotificationsProvider.showNotification(
        user.name,
        message.message,
        id: user.id,
      );
    }
  }
}
