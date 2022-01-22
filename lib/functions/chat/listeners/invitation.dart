import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/sender/chat_saver.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../../../setup.dart';
import 'channel_listener.dart';
import 'channels_registry.dart';

@Named("InviteUserToJoinChat")
@Injectable(as: ChannelListener)
class ChatInvitationListener extends ChannelListener {
  final InviteSender messageSender;
  final ChatDatabaseCubit chatDatabaseCubit;

  final ChatSaver chatSaver;

  ChatInvitationListener(NatsProvider natsProvider, ChannelsRegistry registry,
      this.chatSaver, this.messageSender, this.chatDatabaseCubit)
      : super(natsProvider, registry);

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
    if (!registry.isListening(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as SystemPayload;
      ChatInvitationFields fields =
          ChatInvitationFields.fromMap(mapPayload.fields);
      final chat = fields.chat;

      await sl<ChatCreation>().createDynamically(chat, fields.users);
      await _chatLinkedListeners(chat.id);
      await registry.onlineListener.subscribeOnline();
      await chatSaver.saveChats(newChat: null);
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> _chatLinkedListeners(String chatId) {
    return registry.subscribeOnChatChannels(chatId);
  }
}
