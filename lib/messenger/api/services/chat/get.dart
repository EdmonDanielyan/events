import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/rest_cubit/rest_api_service_state.dart';
import 'package:ink_mobile/messenger/model/chat.dart';

class GetChatsService {
  final int offset;
  final int count;
  final void Function(List<Chat>, String)? successCallback;
  final int myId;
  const GetChatsService(this.offset, this.count,
      {this.successCallback, required this.myId});

  Future<void> call() async {
    final service = RestApiServiceCubit(RestApiServiceState(load: _request));
    await service.load();
  }

  Future<void> _request() async {
    final response = await const MainApi().client.getChats(offset, count);

    if (successCallback != null &&
        response.status == 200 &&
        response.data != null) {
      List<Chat> chats = [];
      if (response.data!.isNotEmpty) {
        for (final chat in response.data!) {
          print(chat.toString());
          chats.add(chat.toLocal(myId: myId));
        }
      }

      successCallback!(chats, response.token);
    }
  }
}
