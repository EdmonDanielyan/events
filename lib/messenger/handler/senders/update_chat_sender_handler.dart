import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ink_mobile/messenger/api/services/chat/update.dart';
import 'package:ink_mobile/messenger/handler/update_chat_handler.dart';
import 'package:ink_mobile/messenger/messenger/senders/update_chat/model.dart';
import 'package:ink_mobile/messenger/messenger/senders/update_chat/update_chat_sender.dart';
import 'package:ink_mobile/messenger/model/chat.dart';

class UpdateChatSenderHandler {
  final Chat chat;
  final int myId;
  const UpdateChatSenderHandler(this.chat, this.myId);

  Future<void> call() async {
    await _makeRequest();
  }

  Future<void> _makeRequest() async {
    EasyLoading.show();
    await UpdateChatService(
      chat,
      successCallback: (chatApi, token) {
        UpdateChatSender(
                UpdateChatModel(chat: chat, initiator: myId, token: token))
            .call();
        UpdateChatHandler(chat).call();
      },
      myId: myId,
    ).call();
    EasyLoading.dismiss();
  }
}
