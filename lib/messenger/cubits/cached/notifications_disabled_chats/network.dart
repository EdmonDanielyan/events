import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/model/notification_sub_state.dart';
import 'package:dio/dio.dart';

class DisabledNotificationsChatNetworkRequest {
  String? chatID;
  bool? value;
  DisabledNotificationsChatNetworkRequest({required this.chatID, required this.value,});

  Future<Response<NotificationSubState>> call() async {
    await Token.setNewTokensIfExpired();
    return
      await getIt.get<MainApiProvider>().getGlobalApi().setNotificationSub(
        'chat',
        chatID,
        value: value,
      );
  }
}