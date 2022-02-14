import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/chat_functions.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/nats/message_delete.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/sender/chat_saver.dart';
import 'package:ink_mobile/messenger/sender/invite_sender.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

import '../cases/chat_notification.dart';
import 'channels_registry.dart';
import 'message_listener.dart';

@Named("RemoveMessage")
@Injectable(as: MessageListener)
class MessageDeletedListener extends MessageListener {
  final ChatFunctions chatFunctions;
  final InviteSender messageSender;
  final ChatDatabaseCubit chatDatabaseCubit;

  final ChatDatabase db;

  final ChatSaver chatSaver;

  MessageDeletedListener(
      NatsProvider natsProvider,
      this.chatDatabaseCubit,
      ChannelsRegistry registry,
      this.chatFunctions,
      this.messageSender,
      this.db,
      this.chatSaver)
      : super(natsProvider, registry);

  @override
  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
    if (!registry.isListening(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as SystemPayload;
      ChatMessageDeleteFields fields =
          ChatMessageDeleteFields.fromMap(mapPayload.fields);
      final sender = fields.user;
      final myMessages =
          MessageListView.getUserMessages(fields.messages, sender.id);
      if (myMessages.isNotEmpty) {
        if (fields.edited) {
          if (sender.id != JwtPayload.myId) {
            _pushNotification(myMessages.last, sender);
          }
          chatFunctions.editMessages(myMessages);
        } else {
          chatFunctions.deleteMessages(myMessages, setPrevious: true);
        }
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> _pushNotification(MessageTable message, UserTable sender) async {
    final myChat = await chatDatabaseCubit.db.selectChatById(message.chatId);

    if (myChat != null) {
      ChatNotification(
        chatDatabaseCubit: chatDatabaseCubit,
        chat: myChat,
        myChat: myChat,
        message: message,
        user: sender,
      ).call(checkTime: false);
    }
  }
}
