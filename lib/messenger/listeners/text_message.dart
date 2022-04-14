import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_opened.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/open_chat.dart';
import 'package:ink_mobile/messenger/cases/send_message.dart';
import 'package:ink_mobile/messenger/cases/user_functions.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/models/chat/nats/message.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/providers/notifications/notifications.dart';
import 'package:ink_mobile/messenger/sender/invite_sender.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/setup.dart';

import '../cases/chat_functions.dart';
import 'channels_registry.dart';
import 'message_listener.dart';

@Named("Text")
@Injectable(as: MessageListener)
class TextMessageListener extends MessageListener with Profileable {
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final InviteSender messageSender;

  final ChatFunctions chatFunctions;

  List<NatsMessage> _buffer = [];
  final _debouncer = Debouncer(milliseconds: 100);

  TextMessageListener(
    NatsProvider natsProvider,
    ChannelsRegistry registry,
    this.userFunctions,
    this.chatDatabaseCubit,
    this.messageSender,
    this.chatFunctions,
  ) : super(natsProvider, registry);

  @override
  Future<void> onMessage(String channel, NatsMessage _message) async {
    super.onMessage(channel, _message);
    if (!isListeningToChannel(channel)) {
      return;
    }
    _buffer.add(_message);

    _debouncer.run(() async {
      final profileId = startProfiling();
      final _currentBuffer = _buffer;
      _buffer = [];
      List<MessageTable> insertList = [];
      for (var message in _currentBuffer) {
        final mapPayload = message.payload! as SystemPayload;

        ChatMessageFields fields = ChatMessageFields.fromMap(mapPayload.fields);

        final newMessage = fields.message.copyWith(
          sequence: message.sequence.toInt(),
          timestamp: message.timestamp,
          sentStatus: MessageSentStatus.SENT,
        );

        _showNotification(message, fields.chat, fields.message, fields.user);

        logger.finest(() => '''
        MESSAGE INSERTING
        message: $newMessage
        timestamp: ${message.timestamp}        
        ''');
        insertList.add(newMessage);
      }
      await GetIt.I<SendMessage>().addMessages(insertList);
      logger.finest("Handling text messages time: ${endProfiling(profileId)}");
    });
  }

  Future<void> _showNotification(NatsMessage message, ChatTable chat,
      MessageTable chatMessage, UserTable user) async {
    final tenMinutesBefore =
        DateTime.now().subtract(const Duration(minutes: 10));
    if (message.timestamp.toLocal().isAfter(tenMinutesBefore)) {
      bool isChatOpened = chatDatabaseCubit.getSelectedChatId == chat.id;
      ChatTable? chatFromDb =
          await chatDatabaseCubit.db.selectChatById(chat.id);

      if ((!isChatOpened || chatDatabaseCubit.isChatInBackground) &&
          (chatFromDb?.notificationsOn ?? true) &&
          chatMessage.userId != JwtPayload.myId) {
        var localNotificationsProvider = sl<LocalNotificationsProvider>();
        localNotificationsProvider.showNotification(
          user.name,
          chatMessage.message,
          payload: chat.id,
          id: chat.id.hashCode,
          onSelect: (_) {
            final openedChat = chatDatabaseCubit.getSelectedChatId;

            if (openedChat != chat.id) {
              OpenChat(sl(), chat,
                  goToFirstScreen:
                      sl<ChatOpenedCubit>().state.enable ? true : false)();
            }
          },
        );
      }
    }
  }
}
