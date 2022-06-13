import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class GetMessagesService {
  final int chatId;
  final int offset;
  final int count;
  final void Function(List<Message>, String)? successCallback;
  final int myId;
  const GetMessagesService(
    this.chatId,
    this.offset,
    this.count, {
    this.successCallback,
    required this.myId,
  });

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load();
  }

  Future<void> _request() async {
    final response =
        await const MainApi().client.getMessages(chatId, offset, count);

    if (successCallback != null &&
        response.status == 200 &&
        response.data != null) {
      List<Message> items = [];
      if (response.data!.isNotEmpty) {
        for (final message in response.data!) {
          items.add(message.toLocal(myId: myId));
        }
      }

      successCallback!(items, response.token);
    }
  }
}
