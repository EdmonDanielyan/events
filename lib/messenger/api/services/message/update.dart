import 'package:ink_mobile/messenger/api/rest_client/message/update/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class UpdateMessageService {
  final Message message;
  final void Function(Message, String)? successCallback;
  final int myId;
  const UpdateMessageService(this.message,
      {this.successCallback, required this.myId});

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load();
  }

  Future<void> _request() async {
    final response = await const MainApi().client.updateMessage(
          message.id,
          UpdateMessageRequest(
            message: message.body,
          ),
        );

    if (successCallback != null &&
        response.status == 200 &&
        response.data != null) {
      successCallback!(response.data!.toLocal(myId: myId), response.token);
    }
  }
}
