import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/listeners/delete_message.dart';
import 'package:ink_mobile/functions/chat/listeners/joined.dart';
import 'package:ink_mobile/functions/chat/listeners/left.dart';
import 'package:ink_mobile/functions/chat/listeners/message_status.dart';
import 'package:ink_mobile/functions/chat/listeners/texting.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/sender/send_system_message.dart';
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
import 'package:fixnum/fixnum.dart';
import 'package:ink_mobile/providers/notifications.dart';

import 'all.dart';

class ChatMessageListener {
  final MessageProvider messageProvider;
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatSendMessage chatSendMessage;

  const ChatMessageListener({
    required this.messageProvider,
    required this.natsProvider,
    required this.userFunctions,
    required this.chatDatabaseCubit,
    required this.chatSendMessage,
  });

  static ChatMessageFields? lastChatMessageFields;

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

      // TODO UPDATE MESSAGE CREATED TIME

      if (fields.user.id != JwtPayload.myId) {
        lastChatMessageFields = fields;
        late ChatTable chat =
            ChatListView.changeChatForParticipant(fields.chat, [fields.user]);
        _debouncer.run(() {
          _pushNotification();
        });

        await userFunctions.insertUser(fields.user);
        await SendMessage(chatDatabaseCubit: chatDatabaseCubit, chat: chat)
            .addMessage(fields.message);
        await UseMessageProvider.messageProvider?.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> _pushNotification() async {
    if (lastChatMessageFields == null) {
      return;
    }
    bool showNotification = true;
    final chatId = lastChatMessageFields!.chat.id;
    final user = lastChatMessageFields!.user;
    final message = lastChatMessageFields!.message;

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
    messageProvider.chatFunctions.updateMessageStatus(message, status);

    messageProvider.saveChats(newChat: null);
  }

  Future<bool> sendTxtMessage(
    ChatTable chat,
    MessageTable message, {
    UserTable? user,
  }) async {
    return await chatSendMessage.sendTextMessage(
      natsProvider.getGroupTextChannelById(chat.id),
      chat,
      message,
      user ?? UserFunctions.getMe,
    );
  }
}
