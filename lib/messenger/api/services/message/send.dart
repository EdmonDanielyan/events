import 'package:ink_mobile/messenger/api/rest_client/message/send/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';
import 'package:ink_mobile/messenger/model/message.dart';

import '../../rest_client/error/error_response.dart';

class SendMessageService {
  final Message message;
  final void Function(Message, String)? successCallback;
  final int myId;
  final void Function(ErrorApiResponse?)? errorCallback;
  const SendMessageService(
    this.message, {
    this.successCallback,
    required this.myId,
    this.errorCallback,
  });

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load(errorCallback: errorCallback);
  }

  Future<void> _request() async {
    final response = await const MainApi().client.sendMessage(
          SendMessageRequest(
            message: message.body,
            chatId: message.chatId,
            type: message.type.index,
            responseTo: message.responseTo?.id,
          ),
        );

    if (successCallback != null &&
        response.status == 200 &&
        response.data != null) {
      successCallback!(response.data!.toLocal(myId: myId), response.token);
    }
  }
}
