import 'package:ink_mobile/messenger/api/services/chat/get.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
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
    final messengerProvider = getIt<MessengerProvider>();
    await GetChatsService(
      offset,
      count,
      myId: chatsCubit.myId,
      successCallback: (chats, token) {
        chatsCubit.updateFetchedChats(chats);
        if (successCallback != null) {
          successCallback!(chats);
        }

        if (chats.isNotEmpty) {
          List<User> participants = [];
          for (final chat in chats) {
            participants.addAll(chat.participants);
            if (!messengerProvider.isListiningToChat(chat.id)) {
              messengerProvider.subscribeToChat(chat.id);
            }
          }

          FetchPartcipants(participants).call();
        }
      },
    ).call();
  }
}
