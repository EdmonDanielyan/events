


import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';

class DisabledNotificationsChatNetworkRequest {
  String? chatID;
  bool? value;
  DisabledNotificationsChatNetworkRequest({required this.chatID, required this.value,});

  call() async => await getIt.get<MainApiProvider>().getGlobalApi().setNotificationSub(
    'chat',
    chatID,
    value: value
  );
}