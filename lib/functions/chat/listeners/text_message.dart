import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/tables/db_enum.dart';
import 'package:ink_mobile/models/chat/nats/message.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:ink_mobile/providers/notifications.dart';
import 'package:ink_mobile/setup.dart';

import '../chat_functions.dart';
import 'channels_registry.dart';
import 'message_listener.dart';

@Named("Text")
@Injectable(as: MessageListener)
class TextMessageListener extends MessageListener {
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final InviteSender messageSender;

  final ChatFunctions chatFunctions;

  TextMessageListener(
    NatsProvider natsProvider,
    ChannelsRegistry registry,
    this.userFunctions,
    this.chatDatabaseCubit,
    this.messageSender,
    this.chatFunctions,
  ) : super(natsProvider, registry);

  @override
  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
    if (!isListeningToChannel(channel)) {
      return;
    }
    try {
      final mapPayload = message.payload! as SystemPayload;

      ChatMessageFields fields = ChatMessageFields.fromMap(mapPayload.fields);

      final newMessage = fields.message.copyWith(
        sequence: message.sequence.toInt(),
        timestamp: message.timestamp,
        sentStatus: (fields.message.sentStatus == MessageSentStatus.SENDING ||
                fields.message.sentStatus == MessageSentStatus.ERROR)
            ? MessageSentStatus.SENT
            : fields.message.sentStatus,
      );

          final messageExists =
              await chatDatabaseCubit.db.selectMessageById(newMessage.id);

          if (messageExists != null) {
            logger.finest(() => '''
        MESSAGE EXISTS
        message: $newMessage
        timestamp: ${message.timestamp}
        
        ''');
        await chatDatabaseCubit.db.updateMessageById(newMessage.id, newMessage);
      } else {
        _showNotification(message, fields.chat, fields.message, fields.user);

        logger.finest(() => '''
        MESSAGE INSERTING
        message: $newMessage
        timestamp: ${message.timestamp}
        
        ''');
        ChatTable? myChat =
            await chatDatabaseCubit.db.selectChatById(fields.chat.id);

        var chat = fields.chat;

        if (fields.user.id != JwtPayload.myId) {
          chat = myChat ??
              ChatListView.changeChatForParticipant(fields.chat, [fields.user]);
        }

        await GetIt.I<SendMessage>().addMessage(chat, newMessage);
        await userFunctions.insertUser(fields.user);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> _showNotification(NatsMessage message, ChatTable chat,
      MessageTable chatMessage, UserTable user) async {
    final tenMinutesBefore =
        DateTime.now().subtract(const Duration(minutes: 10));
    if (message.timestamp.toLocal().isAfter(tenMinutesBefore)) {
      bool isChatOpened = chatDatabaseCubit.getSelectedChatId == chat.id;
      ChatTable? chatFromDb =
          await chatDatabaseCubit.db.selectChatById(chat.id);

      if (!isChatOpened && (chatFromDb?.notificationsOn ?? true) ) {
        var localNotificationsProvider = sl<LocalNotificationsProvider>();
        localNotificationsProvider.showNotification(
          user.name,
          chatMessage.message,
          payload: chat.id,
          id: chat.id.hashCode,
          onSelect: (_) {
            final openedChat = chatDatabaseCubit.getSelectedChatId;

            if (openedChat != chat.id) {
              OpenChat(sl(), chat)();
            }
          },
        );
      }
    }
  }
}
