import 'package:ink_mobile/messenger/api/services/message/get.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_messages/hidden_messages_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/setup.dart';

class FetchMessages {
  final int chatId;
  final int offset;
  final int count;
  final void Function(List<Message>)? successCallback;
  const FetchMessages(
    this.chatId, {
    this.offset = 0,
    this.count = 15,
    this.successCallback,
  });

  Future<void> call() async {
    final chatsCubit = getIt<CachedChatsCubit>();
    await GetMessagesService(
      chatId,
      offset,
      count,
      myId: chatsCubit.myId,
      successCallback: (messages, token) {
        final _messages = getIt<HiddenMessagesCubit>().filter(messages);
        chatsCubit.updateFetchedMessages(_messages, chatId);
        if (successCallback != null) {
          successCallback!(_messages);
        }
      },
    ).call();
  }
}
