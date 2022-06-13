import 'package:ink_mobile/messenger/api/rest_client/chat/update/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';
import 'package:ink_mobile/messenger/model/chat.dart';

class UpdateChatService {
  final Chat chat;
  final void Function(Chat, String)? successCallback;
  final int myId;
  const UpdateChatService(this.chat,
      {this.successCallback, required this.myId});

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load();
  }

  Future<void> _request() async {
    final response = await const MainApi().client.updateChat(
          chat.id,
          UpdateChatRequest(
            name: chat.name,
            description: chat.description,
            avatarUrl: chat.avatarUrl,
          ),
        );

    if (successCallback != null &&
        response.status == 200 &&
        response.data != null) {
      successCallback!(response.data!.toLocal(myId: myId), response.token);
    }
  }
}
