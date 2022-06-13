import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ink_mobile/messenger/api/services/chat/remove_participant.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_chats/hidden_chats_cubit.dart';
import 'package:ink_mobile/messenger/functions/create_info_message.dart';
import 'package:ink_mobile/messenger/handler/remove_users_from_chat.dart';
import 'package:ink_mobile/messenger/messenger/senders/remove_participant/model.dart';
import 'package:ink_mobile/messenger/messenger/senders/remove_participant/remove_participant.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

import 'send_message_handler.dart';

class RemoveParticipantHandler {
  final Chat chat;
  final List<User> users;
  final int myId;
  const RemoveParticipantHandler(this.chat, this.myId, this.users);

  Future<void> call() async {
    if (chat.isSingle) {
      final hiddenChats = getIt<HiddenChatsCubit>();
      hiddenChats.add(chat.id);
      return;
    }

    bool hasMe = users.indexWhere((element) => element.id == myId) >= 0;

    if (hasMe) {
      getIt<MessengerProvider>().unsubscribeFromChat(chat.id);
    }

    await _makeRequest();
  }

  Future<void> _makeRequest() async {
    EasyLoading.show();
    await RemoveParticipantService(
      chat.id,
      user: users.first.id,
      successCallback: (chatApi, token) {
        RemoveParticipantSender(RemoveParticipantModel(
          chatId: chat.id,
          users: users,
          initiatorId: myId,
          token: token,
        ))();

        RemoveUsersFromChatHandler(users, chat)();

        _sendMessage();
      },
      myId: myId,
    ).call();
    EasyLoading.dismiss();
  }

  void _sendMessage() {
    List<String> participantsNames = users.map((e) => e.name).toList();
    final messageBody = participantsNames.join(", ") +
        " " +
        (participantsNames.length == 1
            ? myId == users.first.id
                ? "вышел(ла) из чата"
                : "удален(а) из чата"
            : "удалены из чата");
    final msg = CreateInfoMessage(chat.id, messageBody).call();
    SendMessageHandler([msg], chat).call();
  }
}
