import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
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

import '../chat_functions.dart';
import '../push_notification.dart';
import 'channels_registry.dart';

@Named("Text")
@Injectable(as: ChannelListener)
class TextMessageListener extends ChannelListener {
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

  Debouncer get _debouncer => Debouncer(milliseconds: 800);

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
        created: message.createdAt,
        status: (fields.message.status == MessageStatus.SENDING ||
                fields.message.status == MessageStatus.ERROR)
            ? MessageStatus.SENT
            : fields.message.status,
      );

      final messageExists =
          await chatDatabaseCubit.db.selectMessageById(newMessage.id);

      if (messageExists != null) {
        logger.finest('''
        MESSAGE EXISTS
        message: $newMessage
        created: ${message.createdAt}
        
        ''');
        chatDatabaseCubit.db.updateMessageById(newMessage.id, newMessage);
      } else {
        logger.finest('''
        MESSAGE INSERTING
        message: $newMessage
        created: ${message.createdAt}
        
        ''');
        ChatTable? myChat =
            await chatDatabaseCubit.db.selectChatById(fields.chat.id);

        var chat = fields.chat;

        if (fields.user.id != JwtPayload.myId) {
          chat = myChat ??
              ChatListView.changeChatForParticipant(fields.chat, [fields.user]);
        }

        _debouncer.run(() {
          PushChatNotification(
            chatDatabaseCubit: chatDatabaseCubit,
            chat: chat,
            myChat: myChat,
            message: newMessage,
            user: fields.user,
          ).call();
        });

        await GetIt.I<SendMessage>().addMessage(chat, newMessage);
        await userFunctions.insertUser(fields.user);
      }
    } on NoSuchMethodError {
      return;
    }
  }
}
