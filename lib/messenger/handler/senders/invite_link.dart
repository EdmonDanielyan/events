import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ink_mobile/messenger/api/rest_client/chat/invite/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/api/services/chat/invite.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';
import 'package:ink_mobile/messenger/functions/create_info_message.dart';
import 'package:ink_mobile/messenger/messenger/senders/add_participant/add_participant.dart';
import 'package:ink_mobile/messenger/messenger/senders/add_participant/model.dart';
import 'package:ink_mobile/messenger/messenger/senders/invitation/invitation.dart';
import 'package:ink_mobile/messenger/messenger/senders/invitation/model.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';

import 'send_message_handler.dart';

class InviteLinkSenderHandler {
  final int chatId;
  final List<int> usersId;
  // final int myId;
  const InviteLinkSenderHandler(this.chatId, this.usersId);

  Future<void> call() async {
    await _makeRequest();
  }

  Future<void> _makeRequest() async {
    EasyLoading.show();
    await InviteChatLinkService(
      userId: usersId, chatId: chatId,

      // userId: usersId,
      // successCallback: (chatApi, token) {
      //   final participants =
      //       chat.participants.isNotEmpty ? [chat.participants.first] : [];
      //   InvitationSender(InvitationSenderModel(
      //     chat: chat.copyWith(
      //       participants: List.from(participants)..addAll(users),
      //       messages: [],
      //     ),
      //     token: token,
      //   ))();
      //   AddParticipantSender(
      //     AddParticipantModel(
      //       chatId: chat.id,
      //       users: users,
      //       token: token,
      //     ),
      //   )();

      // },
    ).call();
    _sendMessage();
    EasyLoading.dismiss();
  }

  void _sendMessage() {
    // List<String> participantsNames = ['Павел', 'Валера', 'Дмитрий'];
  }
}

class InviteChatLinkService {
  final int chatId;
  final List<int> userId;
  final void Function(Chat, String)? successCallback;
  // final int myId;
  const InviteChatLinkService({
    this.successCallback,
    required this.chatId,
    // this.successCallback,
    required this.userId,
    // required this.myId,
  });

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load();
  }

  Future<void> _request() async {
    final response = await const MainApi().client.chatInvite(
          InviteChatRequest(
            chatId: chatId,
            users: userId,
          ),
        );
    final id = userId.elementAt(0);

    if (successCallback != null &&
        response.status == 200 &&
        response.data != null) {
      successCallback!(response.data!.toLocal(myId: id), response.token);
    }
  }
}
