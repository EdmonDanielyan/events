// ignore_for_file: file_names

import 'package:ink_mobile/messenger/api/services/message/read.dart';
import 'package:ink_mobile/messenger/handler/read_messages.dart';
import 'package:ink_mobile/messenger/messenger/senders/read_message/model.dart';
import 'package:ink_mobile/messenger/messenger/senders/read_message/read_message.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class ReadMessagesSenderHandler {
  final Message lastMessage;
  final int myId;
  const ReadMessagesSenderHandler(this.lastMessage, this.myId);

  Future<void> call() async {
    await _makeRequest();
  }

  Future<void> _makeRequest() async {
    await ReadMessagesService(
      lastMessage.id,
      successCallback: (token) {
        if (!lastMessage.isReadByMe(myId)) {
          ReadMessagesHandler(lastMessage, myId).call();
          ReadMessageSender(
            ReadMessageModel(
              lastMessage: lastMessage,
              initiatorId: myId,
              token: token,
            ),
          ).call();
        }
      },
    ).call();
  }
}
