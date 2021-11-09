import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/listeners/message_status.dart';
import 'package:ink_mobile/functions/chat/listeners/texting.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/sender/send_system_message.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/message.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:fixnum/fixnum.dart';

import 'all.dart';

class ChatMessageListener {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatSendMessage chatSendMessage;
  final MessageStatusListener messageStatusListener;
  final MessageTextingListener messageTextingListener;

  const ChatMessageListener({
    required this.natsProvider,
    required this.userFunctions,
    required this.chatDatabaseCubit,
    required this.chatSendMessage,
    required this.messageStatusListener,
    required this.messageTextingListener,
  });

  NatsListener get natsListener =>
      UseMessageProvider.messageProvider.natsListener;

  Future<void> listenTo(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    try {
      if (!natsListener.listeningToChannel(channel)) {
        await natsProvider.subscribeToChannel(channel, onMessage,
            startSequence: startSequence);
        await messageStatusListener.listenTo("", chatChannel: channel);
        await messageTextingListener.listenTo("", chatChannel: channel);
      }
    } on SubscriptionAlreadyExistException {}
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    final mapPayload = message.payload! as SystemPayload;
    ChatMessageFields fields = ChatMessageFields.fromMap(mapPayload.fields);
    if (fields.user.id != JwtPayload.myId) {
      late ChatTable chat =
          ChatListView.changeChatForParticipant(fields.chat, [fields.user]);
      await userFunctions.insertUser(fields.user);
      await SendMessage(chatDatabaseCubit: chatDatabaseCubit, chat: chat)
          .addMessage(fields.message);
      await chatSendMessage.saveToPrivateUserChatIdList(
          userId: JwtPayload.myId, channel: channel, chat: chat);
    }
  }
}
