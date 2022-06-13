import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/setup.dart';

import 'send_message_handler.dart';

class SendStoredMessagesHandler {
  const SendStoredMessagesHandler();

  Future<void> call() async {
    final chatsCubit = getIt<CachedChatsCubit>();
    final messages = chatsCubit.getNotSentMessages();
    if (messages.isNotEmpty) {
      for (final msg in messages) {
        final chat = chatsCubit.getChatById(msg.chatId);

        if (chat != null) {
          await SendMessageHandler([msg], chat).call();
        }
      }
    }
  }
}
