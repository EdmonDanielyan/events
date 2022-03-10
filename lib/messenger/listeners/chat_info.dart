import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/listeners/message_listener.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/chat_info.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/sender/invite_sender.dart';

import '../cases/user_functions.dart';
import 'channels_registry.dart';

@Named("UpdateChatInfo")
@Injectable(as: MessageListener)
class ChatInfoListener extends MessageListener {
  final ChatDatabaseCubit chatDatabaseCubit;

  final InviteSender messageSender;

  final UserFunctions userFunctions;

  ChatInfoListener(NatsProvider natsProvider, ChannelsRegistry registry,
      this.userFunctions, this.chatDatabaseCubit, this.messageSender)
      : super(natsProvider, registry);

  @override
  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
    if (!isListeningToChannel(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as JsonPayload;
      ChatInfoUpdatePayload data =
          ChatInfoUpdatePayload.fromJson(mapPayload.json);
      var chat = data.chat.toChatTable();
      await chatDatabaseCubit.db.updateChat(chat);
    } on NoSuchMethodError {
      return;
    }
  }
}
