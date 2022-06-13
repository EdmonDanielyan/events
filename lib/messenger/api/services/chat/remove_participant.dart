import 'package:ink_mobile/messenger/api/rest_client/chat/remove_participant/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';
import 'package:ink_mobile/messenger/model/chat.dart';

class RemoveParticipantService {
  final int chatId;
  final int user;
  final void Function(Chat, String)? successCallback;
  final int myId;
  const RemoveParticipantService(
    this.chatId, {
    this.successCallback,
    required this.user,
    required this.myId,
  });

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load();
  }

  Future<void> _request() async {
    final response = await const MainApi().client.kickUser(
          RemoveParticipantRequest(
            chatId: chatId,
            user: user,
          ),
        );

    if (successCallback != null &&
        response.status == 200 &&
        response.data != null) {
      successCallback!(response.data!.toLocal(myId: myId), response.token);
    }
  }
}
