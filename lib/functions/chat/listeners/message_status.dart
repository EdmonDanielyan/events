import 'package:injectable/injectable.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/listeners/channels_registry.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats/message_status.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

@Named("UserReacted")
@Injectable(as: ChannelListener)
class MessageStatusListener extends ChannelListener {
  final ChatFunctions chatFunctions;

  MessageStatusListener(
      NatsProvider natsProvider, ChannelsRegistry registry, this.chatFunctions)
      : super(natsProvider, registry);

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
    if (!isListeningToChannel(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as SystemPayload;
      ChatMessageStatusFields fields =
          ChatMessageStatusFields.fromMap(mapPayload.fields);

      List<MessageTable> messages = fields.messages;
      final notReadMessages = MessageListView.notReadMessages(messages);

      if (notReadMessages.isNotEmpty) {
        chatFunctions.messagesToRead(notReadMessages);
      }
    } on NoSuchMethodError {
      return;
    }
  }
}
