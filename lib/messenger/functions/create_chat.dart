import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/setup.dart';

import 'date_functions.dart';

class CreateChat {
  final List<User> users;
  final User owner;
  const CreateChat(this.users, this.owner);

  CachedChatsCubit get chatsCubit => getIt<CachedChatsCubit>();

  Chat call() {
    final chat = Chat(
      id: generateId,
      avatarUrl: getType == ChatType.single ? users.first.avatarUrl : "",
      name: getType == ChatType.single ? users.first.name : groupName,
      ownerId: owner.id,
      participants: List.from([owner])..addAll(users),
      type: getType,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );

    return chat;
  }

  int get generateId {
    if (getType == ChatType.single) {
      final filtered = List<User>.from([owner])
        ..addAll(users)
        ..sort((a, b) => a.id.compareTo(b.id));

      final getChat = chatsCubit.singleChatExists(filtered);

      if (getChat != null) {
        return getChat.id;
      }
    }

    return DateTime.now().millisecondsSinceEpoch;
  }

  String get groupName =>
      "Группа ${DateFunctions(DateTime.now()).minutesHoursDayMonthYear()}";

  ChatType get getType => users.length == 1 ? ChatType.single : ChatType.group;
}
