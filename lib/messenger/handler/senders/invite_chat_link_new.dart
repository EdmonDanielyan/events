import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ink_mobile/messenger/api/services/chat/invite.dart';
import 'package:ink_mobile/messenger/functions/create_info_message.dart';
import 'package:ink_mobile/messenger/messenger/senders/add_participant/add_participant.dart';
import 'package:ink_mobile/messenger/messenger/senders/add_participant/model.dart';
import 'package:ink_mobile/messenger/messenger/senders/invitation/invitation.dart';
import 'package:ink_mobile/messenger/messenger/senders/invitation/model.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';

import 'send_message_handler.dart';

class InviteChatSenderHandlerNew {
  final Chat chat;
  final List<User> users;
  final int myId;
  const InviteChatSenderHandlerNew(this.chat, this.myId, this.users);

  Future<void> call() async {
    await _makeRequest();
  }

  Future<void> _makeRequest() async {
    EasyLoading.show();
    await InviteChatService(
      chat.id,
      users: users.map((e) => e.id).toList(),
      successCallback: (chatApi, token) {
        final participants =
            chat.participants.isNotEmpty ? [chat.participants.first] : [];
        InvitationSender(InvitationSenderModel(
          chat: chat.copyWith(
            participants: List.from(participants)..addAll(users),
            messages: [],
          ),
          token: token,
        ))();
        AddParticipantSender(
          AddParticipantModel(
            chatId: chat.id,
            users: users,
            token: token,
          ),
        )();

        _sendMessage();
      },
      myId: myId,
    ).call();
    EasyLoading.dismiss();
  }

  void _sendMessage() {
    List<String> participantsNames = users.map((e) => e.name).toList();
    final messageBody =
        "${participantsNames.join(", ")} ${participantsNames.length == 1 ? "добавлен(а) в чат" : "добавлены в чат"}";
    final msg = CreateInfoMessage(chat.id, messageBody).call();
    SendMessageHandler([msg], chat).call();
  }
}
