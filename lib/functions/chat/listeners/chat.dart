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
import 'package:ink_mobile/models/chat/nats/message.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:fixnum/fixnum.dart';
import 'package:ink_mobile/providers/notifications.dart';

import 'all.dart';

class ChatMessageListener {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatSendMessage chatSendMessage;
  final MessageStatusListener messageStatusListener;
  final MessageTextingListener messageTextingListener;
  final ChatJoinedListener chatJoinedListener;
  final ChatLeftListener chatLeftListener;
  final MessageDeletedListener messageDeletedListener;

  const ChatMessageListener({
    required this.natsProvider,
    required this.userFunctions,
    required this.chatDatabaseCubit,
    required this.chatSendMessage,
    required this.messageStatusListener,
    required this.messageTextingListener,
    required this.chatJoinedListener,
    required this.chatLeftListener,
    required this.messageDeletedListener,
  });

  NatsListener get natsListener =>
      UseMessageProvider.messageProvider.natsListener;

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

    final mapPayload = message.payload! as SystemPayload;
    ChatMessageFields fields = ChatMessageFields.fromMap(mapPayload.fields);

    if (fields.user.id != JwtPayload.myId) {
      late ChatTable chat =
          ChatListView.changeChatForParticipant(fields.chat, [fields.user]);
      _pushNotification(chat.id, fields.user, fields.message);
      await userFunctions.insertUser(fields.user);
      await SendMessage(chatDatabaseCubit: chatDatabaseCubit, chat: chat)
          .addMessage(fields.message);
    }
  }

  Future<void> _pushNotification(
      String chatId, UserTable user, MessageTable message) async {
    bool showNotification = true;

    ChatTable? myChat = await chatDatabaseCubit.db.selectChatById(chatId);
    final selectedChat = chatDatabaseCubit.selectedChat;

    if (myChat != null && !myChat.notificationsOn) {
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
