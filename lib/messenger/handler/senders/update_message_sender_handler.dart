import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ink_mobile/messenger/api/services/message/update.dart';
import 'package:ink_mobile/messenger/messenger/senders/update_message/message.dart';
import 'package:ink_mobile/messenger/messenger/senders/update_message/model.dart';
import 'package:ink_mobile/messenger/model/message.dart';

import '../update_messages.dart';

class UpdateMessageSenderHandler {
  final Message message;
  final int myId;
  const UpdateMessageSenderHandler(this.message, this.myId);

  Future<void> call() async {
    await _makeRequest();
  }

  Future<void> _makeRequest() async {
    EasyLoading.show();
    await UpdateMessageService(
      message,
      successCallback: (msg, token) {
        UpdateMessageSender(
          UpdateMessageSenderModel(
            messages: [message],
            initiator: myId,
            token: token,
          ),
        ).call();
        UpdateMessagesHandler([message], message.chatId, initiatorId: myId)
            .call();
      },
      myId: myId,
    ).call();
    EasyLoading.dismiss();
  }
}
