import 'package:ink_mobile/messenger/api/services/chat/get_list.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

class FetchChatList {
  final void Function(List<int>)? successCallback;
  const FetchChatList({this.successCallback});

  Future<void> call() async {
    final mProvider = getIt<MessengerProvider>();

    await GetChatListService(
      successCallback: (chats, token) {
        if (successCallback != null) {
          successCallback!(chats);
        }
        _subscribeToChats(mProvider, chats);
      },
    ).call();
  }

  void _subscribeToChats(MessengerProvider messenger, List<int> chats) {
    if (chats.isNotEmpty) {
      for (final chat in chats) {
        messenger.subscribeToChat(chat);
      }
    }
  }
}
