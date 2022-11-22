import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/setup.dart';

class ReadMessagesHandler {
  final Message lastMessage;
  final int initiatorId;
  const ReadMessagesHandler(this.lastMessage, this.initiatorId);

  void call() {
    final chatsCubit = getIt<CachedChatsCubit>();
    final chat = chatsCubit.getChatById(lastMessage.chatId);

    if (chat != null) {
      final messages = chat.messages;
      final msgIndex =
          messages.lastIndexWhere((element) => element.id == lastMessage.id);

      if (msgIndex >= 0) {
        final notRead = messages
            .getRange(0, msgIndex + 1)
            .where((element) => !element.isReadByMe(initiatorId))
            .toList();

        if (notRead.isNotEmpty) {
          for (final msg in notRead) {
            final index =
                messages.lastIndexWhere((element) => element.id == msg.id);

            if (index >= 0) {
              messages[index] = messages[index].copyWith(
                readBy: List<int>.from(messages[index].readBy)
                  ..add(initiatorId),
              );
            }
          }

          final newChat = chat.copyWith(
            messages: List<Message>.from([])..addAll(messages),
          );

          chatsCubit.updateChatById(newChat, chat.id);
        }
      }
    }
  }
}
