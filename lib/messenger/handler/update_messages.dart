import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/setup.dart';

class UpdateMessagesHandler {
  final List<Message> messages;
  final int chatId;
  final int initiatorId;
  const UpdateMessagesHandler(this.messages, this.chatId,
      {required this.initiatorId});

  void call() {
    final chatsCubit = getIt<CachedChatsCubit>();
    final chat = chatsCubit.getChatById(chatId);

    if (chat != null) {
      List<Message> newMessages = List.from(chat.messages);

      for (final message in messages) {
        final index = newMessages.indexWhere((element) =>
            element.id == message.id && element.owner.id == initiatorId);

        if (index >= 0) {
          newMessages[index] = newMessages[index].copyWith(
            body: message.body,
            edited: true,
          );
        }
      }

      chatsCubit.updateChatById(chat.copyWith(messages: newMessages));
    }
  }
}
