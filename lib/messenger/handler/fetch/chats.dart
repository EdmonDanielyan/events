import 'package:ink_mobile/messenger/api/services/chat/get.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/handler/fetch/participant.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

import '../../model/user.dart';

class FetchChats {
  final int offset;
  final int count;
  final void Function(List<Chat>)? successCallback;
  const FetchChats({this.offset = 0, this.count = 15, this.successCallback});

  Future<void> call() async {
    final chatsCubit = getIt<CachedChatsCubit>();
    final usersCubit = getIt<CachedUsersCubit>();
    final messengerProvider = getIt<MessengerProvider>();
    await GetChatsService(
      offset,
      count,
      myId: chatsCubit.myId,
      successCallback: (chats, token) async {
        chatsCubit.updateFetchedChats(chats);
        if (successCallback != null) {
          successCallback!(chats);
        }

        if (chats.isNotEmpty) {
          for (final chat in chats) {
            List<User> participants = [];
            participants.addAll(chat.participants);
            if (!messengerProvider.isListiningToChat(chat.id)) {
              messengerProvider.subscribeToChat(chat.id);
            }
            await FetchParticipants(participants).call();
            List<int> participantsIds = participants.map((e) => e.id).toList();
            participants = usersCubit.users
                .where((user) => participantsIds.contains(user.id))
                .toList();
            chatsCubit
                .updateChatById(chat.copyWith(participants: participants));
          }
        }
      },
    ).call();
  }
}
