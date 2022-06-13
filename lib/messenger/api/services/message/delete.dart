import 'package:ink_mobile/messenger/api/rest_client/message/delete/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class DeleteMessagesService {
  final List<Message> messages;
  final void Function(String)? successCallback;
  const DeleteMessagesService(this.messages, {this.successCallback});

  Future<void> call() async {
    if (messages.isEmpty) {
      _callback("");
    } else {
      final service = RestApiServiceCubit(RestApiServiceState(load: _request));
      await service.load();
    }
  }

  Future<void> _request() async {
    final response = await const MainApi().client.deleteMessages(
          DeleteMessagesRequest(
            messageIds: messages.map((e) => e.id).toList(),
          ),
        );

    if (response.status == 200) {
      _callback(response.token);
    }
  }

  void _callback(String token) {
    if (successCallback != null) {
      successCallback!(token);
    }
  }
}
