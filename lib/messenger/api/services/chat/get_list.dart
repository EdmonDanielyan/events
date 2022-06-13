import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';

class GetChatListService {
  final void Function(List<int>, String)? successCallback;
  const GetChatListService({this.successCallback});

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load();
  }

  Future<void> _request() async {
    final response = await const MainApi().client.getChatList();

    if (successCallback != null &&
        response.status == 200 &&
        response.data != null) {
      successCallback!(response.data!, response.token);
    }
  }
}
