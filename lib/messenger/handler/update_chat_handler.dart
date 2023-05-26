import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/setup.dart';

class UpdateChatHandler {
  final Chat chat;
  const UpdateChatHandler(this.chat);

  void call() {
    final chatsCubit = getIt<CachedChatsCubit>();

    final storedChat = chatsCubit.getChatById(chat.id);

    if (storedChat != null && storedChat.isGroup) {
      chatsCubit.updateChatById(
        storedChat.copyWith(
          name: chat.name,
          avatarUrl: chat.avatarUrl,
          description: chat.description,
        ),
      );
    }
  }
}
