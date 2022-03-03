import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cases/chat_functions.dart';
import 'package:ink_mobile/messenger/listeners/channels_registry.dart';
import 'package:ink_mobile/messenger/listeners/message_listener.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/nats/message_status.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/models/debouncer.dart';

@Named("UserReacted")
@Injectable(as: MessageListener)
class MessageStatusListener extends MessageListener {
  final ChatFunctions chatFunctions;

  MessageStatusListener(
      NatsProvider natsProvider, ChannelsRegistry registry, this.chatFunctions)
      : super(natsProvider, registry);

  List<NatsMessage> _buffer = [];
  final _debouncer = Debouncer(milliseconds: 100);

  Future<void> onMessage(String channel, NatsMessage _message) async {
    super.onMessage(channel, _message);
    if (!isListeningToChannel(channel)) {
      return;
    }

    _buffer.add(_message);

    _debouncer.run(() async {
      final _currentBuffer = _buffer;
      _buffer = [];
      List<String> allNotReadChats = [];
      for (var message in _currentBuffer) {
        final mapPayload = message.payload! as SystemPayload;
        ChatMessageStatusFields fields =
            ChatMessageStatusFields.fromMap(mapPayload.fields);

        List<MessageTable> messages = fields.messages;
        final notReadMessages = MessageListView.notReadMessages(messages);

        if (notReadMessages.isNotEmpty) {
          allNotReadChats.add(messages.last.chatId);
        }
      }
      await registry.chatDatabaseCubit.db
          .updateMessageListReadStatus(allNotReadChats);
    });
  }
}