import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/setup.dart';

class AddUsersToChatHandler {
  final List<User> users;
  final Chat chat;

  const AddUsersToChatHandler(this.users, this.chat);

  void call() {
    if (users.isNotEmpty) {
      final chatsCubit = getIt<CachedChatsCubit>();
      List<User> participants = List.from(chat.participants)..addAll(users);
      chatsCubit.updateChatById(
          chat.copyWith(participants: participants.toSet().toList()), chat.id);
    }
  }
}
