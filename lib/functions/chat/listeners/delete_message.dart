import 'package:injectable/injectable.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats/message_delete.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import 'channels_registry.dart';

@Named("RemoveMessage")
@Injectable(as: ChannelListener)
class MessageDeletedListener extends ChannelListener {
  final ChatFunctions chatFunctions;
  final InviteSender messageSender;

  MessageDeletedListener(
      NatsProvider natsProvider,
      ChannelsRegistry registry,
      this.chatFunctions,
      this.messageSender)
      : super(natsProvider, registry);

  Future<void> onMessage(String channel, NatsMessage message) async {
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
      if (myMessages.isNotEmpty && sender.id != JwtPayload.myId) {
        chatFunctions.deleteMessages(myMessages);
        await UseMessageProvider.messageProvider?.chatSaver
            .saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }
}
