import 'package:fixnum/fixnum.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/chat_info.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../user_functions.dart';

class ChatInfoListener {
  final MessageProvider messageProvider;
  final NatsProvider natsProvider;
  final ChatDatabaseCubit chatDatabaseCubit;
  ChatInfoListener({
    required this.messageProvider,
    required this.natsProvider,
    required this.chatDatabaseCubit,
  });

  NatsListener get natsListener =>
      UseMessageProvider.messageProvider!.natsListener;
  bool isListeningToChannel(String channel) =>
      natsListener.listeningToChannel(channel);

  Future<void> listenTo(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    try {
      if (!isListeningToChannel(channel)) {
        await natsProvider.subscribeToChannel(channel, onMessage,
            startSequence: startSequence);
      }
    } on SubscriptionAlreadyExistException {}
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
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

  Future<bool> sendNewChatInfo(ChatTable chat, {UserTable? user}) async {
    bool send = await messageProvider.chatSendMessage.sendNewChatInfo(
      natsProvider.getGroupChatInfoById(chat.id),
      chat: chat,
      user: user ?? UserFunctions.getMe,
    );
    messageProvider.saveChats(newChat: null);
    return send;
  }
}