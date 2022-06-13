import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/setup.dart';

class RemoveUsersFromChatHandler {
  final List<User> users;
  final Chat chat;
  final int? initiatorId;
  const RemoveUsersFromChatHandler(this.users, this.chat, {this.initiatorId});

  void call() {
    if (users.isNotEmpty) {
      final chatsCubit = getIt<CachedChatsCubit>();
      List<User> participants = List.from(chat.participants);
      for (final user in users) {
        if (user.id == chatsCubit.myId) {
          chatsCubit.removeChatById(chat.id);
        }

        participants.removeWhere((element) => element.id == user.id);
      }
      chatsCubit.updateChatById(
          chat.copyWith(participants: participants), chat.id);
    }
  }
}
