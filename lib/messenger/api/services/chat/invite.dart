import 'package:ink_mobile/messenger/api/rest_client/chat/invite/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';
import 'package:ink_mobile/messenger/model/chat.dart';

class InviteChatService {
  final int chatId;
  final List<int> users;
  final void Function(Chat, String)? successCallback;
  final int myId;
  const InviteChatService(
    this.chatId, {
    this.successCallback,
    required this.users,
    required this.myId,
  });

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load();
  }

  Future<void> _request() async {
    final response = await const MainApi().client.chatInvite(
          InviteChatRequest(
            chatId: chatId,
            users: users,
          ),
        );

    if (successCallback != null &&
        response.status == 200 &&
        response.data != null) {
      successCallback!(response.data!.toLocal(myId: myId), response.token);
    }
  }
}
