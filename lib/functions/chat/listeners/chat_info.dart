import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/models/chat/nats/chat_info.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';
import 'channels_registry.dart';

@Named("UpdateChatInfo")
@Injectable(as: ChannelListener)
class ChatInfoListener extends ChannelListener {
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
      final mapPayload = message.payload! as SystemPayload;
      ChatInfoFields fields = ChatInfoFields.fromMap(mapPayload.fields);

      final chat = fields.chat;
      final user = fields.user;

      if (user.id != JwtPayload.myId) {
        chatDatabaseCubit.db.updateChatById(chat.id, chat);
      }
    } on NoSuchMethodError {
      return;
    }
  }
}
