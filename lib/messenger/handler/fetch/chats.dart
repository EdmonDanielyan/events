import 'package:ink_mobile/messenger/api/services/chat/get.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/handler/fetch/participant.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

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
          for (final chat in chats) {
            FetchPartcipants(chat.participants).call();
            if (!messengerProvider.isListiningToChat(chat.id)) {
              messengerProvider.subscribeToChat(chat.id);
            }
          }
        }
      },
    ).call();
  }
}
