import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/setup.dart';

class RemoveChatHandler {
  final Chat chat;
  const RemoveChatHandler(this.chat);

  void call() {
    final chatsCubit = getIt<CachedChatsCubit>();
    if (!chat.isSingle) {
      chatsCubit.removeChatById(chat.id);
    }
  }
}
