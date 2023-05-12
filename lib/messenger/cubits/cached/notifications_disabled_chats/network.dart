import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/global_api.dart';
import 'package:main_api_client/model/notification_sub_state.dart';
import 'package:dio/dio.dart';

class ToggleNotificationsChatNetworkRequest {
  String? chatID;
  bool? value;
  ToggleNotificationsChatNetworkRequest({required this.chatID, required this.value,});

  Future<Response<NotificationSubState>> call() async {
    GlobalApi globalApi = getIt.get<MainApiProvider>().getGlobalApi();
    return await globalApi.setNotificationSub(
        'chat',
        chatID,
        value: value,
      );
  }
}