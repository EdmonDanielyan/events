import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/sender/message_sender.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats/message.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:ink_mobile/providers/notifications.dart';

import 'all.dart';

@injectable
class ChatMessageListener {
  final MessageProvider messageProvider;
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final MessageSender messageSender;

  const ChatMessageListener({
    required this.messageProvider,
    required this.natsProvider,
    required this.userFunctions,
    required this.chatDatabaseCubit,
    required this.messageSender,
  });

  Debouncer get _debouncer => Debouncer(milliseconds: 400);

  NatsListener get natsListener =>
      UseMessageProvider.messageProvider!.natsListener;

  bool isListeningToChannel(String channel) =>
      natsListener.listeningToChannel(channel);

  Future<void> listenTo(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    try {
      if (!isListeningToChannel(channel)) {
        await natsProvider.subscribeToChannel(
          channel,
          onMessage,
          startSequence: startSequence,
        );
      }
    } on SubscriptionAlreadyExistException {}
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    if (!isListeningToChannel(channel)) {
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
        late ChatTable chat =
            ChatListView.changeChatForParticipant(fields.chat, [fields.user]);
        _debouncer.run(() {
          _pushNotification(
              chatId: chat.id, message: newMessage, user: fields.user);
        });

        await userFunctions.insertUser(fields.user);
        await SendMessage(chatDatabaseCubit: chatDatabaseCubit, chat: chat)
            .addMessage(newMessage);
        await UseMessageProvider.messageProvider?.chatSaver.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> _pushNotification(
      {required String chatId,
      required UserTable user,
      required MessageTable message}) async {
    bool showNotification = true;

    ChatTable? myChat = await chatDatabaseCubit.db.selectChatById(chatId);
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

  Future<void> sendMessage(ChatTable chat, MessageTable message) async {
    bool success = await sendTxtMessage(chat, message);
    MessageStatus status = success ? MessageStatus.SENT : MessageStatus.ERROR;
    await messageProvider.chatFunctions.updateMessageStatus(message, status);

    messageProvider.chatSaver.saveChats(newChat: null);
  }

  Future<bool> sendTxtMessage(
    ChatTable chat,
    MessageTable message, {
    UserTable? user,
  }) async {
    return await messageSender.sendTextMessage(
      natsProvider.getGroupTextChannelById(chat.id),
      chat,
      message,
      user ?? UserFunctions.getMe,
    );
  }

  Future<void> redeliverMessages({int? userId}) async {
    final unsentMessages =
        await chatDatabaseCubit.db.getUnsentMessages(userId ?? JwtPayload.myId);

    Map<String, ChatTable> chats = {};

    if (unsentMessages.isNotEmpty) {
      for (final message in unsentMessages) {
        if (!chats.containsKey(message.chatId)) {
          final chat =
              await chatDatabaseCubit.db.selectChatById(message.chatId);

          if (chat != null) {
            chats[message.chatId] = chat;
          }
        }

        if (chats.containsKey(message.chatId)) {
          print(
              "SENDING MESSAGE ${chats[message.chatId]!.name} AND MESSAGE ${message.message}");
          await sendMessage(chats[message.chatId]!, message);
        }
      }
    }
  }
}
