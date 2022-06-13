import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ink_mobile/messenger/api/services/message/delete.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_messages/hidden_messages_cubit.dart';
import 'package:ink_mobile/messenger/handler/remove_messages.dart';
import 'package:ink_mobile/messenger/messenger/senders/delete_message/message.dart';
import 'package:ink_mobile/messenger/messenger/senders/delete_message/model.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/setup.dart';

class DeleteMessagesSenderHandler {
  final List<Message> messages;
  final int myId;
  final int chatId;
  const DeleteMessagesSenderHandler(this.messages, this.myId, this.chatId);

  Future<void> call() async {
    final oppositeMessages =
        messages.where((element) => !element.isByMe(myId)).toList();
    if (oppositeMessages.isNotEmpty) {
      getIt<HiddenMessagesCubit>()
          .add(oppositeMessages.map((e) => e.id).toList());
    }

    await _makeRequest();
  }

  Future<void> _makeRequest() async {
    EasyLoading.show();
    await DeleteMessagesService(
      messages.where((element) => element.isByMe(myId)).toList(),
      successCallback: (token) {
        RemoveMessagesHandler(messages, chatId).call();
        if (token.isNotEmpty) {
          DeleteMessageSender(DeleteMessageSenderModel(
            messages: messages,
            initiator: myId,
            token: token,
          )).call();
        }
      },
    ).call();
    EasyLoading.dismiss();
  }
}
