import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/chat_creation.dart';
import 'package:ink_mobile/messenger/models/chat/nats/invitation.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/sender/chat_saver.dart';
import 'package:ink_mobile/messenger/sender/invite_sender.dart';

import '../../../setup.dart';
import 'channels_registry.dart';
import 'message_listener.dart';

@Named("InviteUserToJoinChat")
@Injectable(as: MessageListener)
class ChatInvitationListener extends MessageListener {
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
      await chatSaver.saveChats(newChat: null);
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> _chatLinkedListeners(String chatId) {
    return registry.subscribeOnChatChannels(chatId);
  }
}