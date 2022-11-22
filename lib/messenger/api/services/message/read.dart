import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';

import '../../rest_client/error/error_response.dart';

class ReadMessagesService {
  final int messageId;
  final void Function(String)? successCallback;
  final void Function(ErrorApiResponse?)? errorCallback;
  const ReadMessagesService(
    this.messageId, {
    this.successCallback,
    this.errorCallback,
  });

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load(errorCallback: errorCallback);
  }

  Future<void> _request() async {
    final response = await const MainApi().client.readMessage(messageId);

    if (successCallback != null && response.status == 200) {
      successCallback!(response.token);
    }
  }
}
