import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';

class ReadMessagesService {
  final int messageId;
  final void Function(String)? successCallback;
  const ReadMessagesService(this.messageId, {this.successCallback});

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load();
  }

  Future<void> _request() async {
    final response = await const MainApi().client.readMessage(messageId);

    if (successCallback != null && response.status == 200) {
      successCallback!(response.token);
    }
  }
}
