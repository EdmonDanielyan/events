import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/setup.dart';

class RemoveMessagesHandler {
  final List<Message> messages;
  final int chatId;
  final int? initiatorId;
  final bool deleteOnlyInitiators;
  const RemoveMessagesHandler(this.messages, this.chatId,
      {this.initiatorId, this.deleteOnlyInitiators = false});

  void call() {
    final chatsCubit = getIt<CachedChatsCubit>();
    final chat = chatsCubit.getChatById(chatId);

    if (chat != null) {
      List<Message> newMessages = List.from(chat.messages);
      for (final message in messages) {
        if (deleteOnlyInitiators && initiatorId != null) {
          newMessages.removeWhere((element) =>
              element.id == message.id && element.owner.id == initiatorId);
        } else {
          newMessages.removeWhere((element) => element.id == message.id);
        }
      }

      chatsCubit.updateChatById(chat.copyWith(messages: newMessages));
    }
  }
}
