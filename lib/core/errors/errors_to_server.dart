import 'package:ink_mobile/functions/device_info.dart';

class ErrorsToServer {
  final String error;
  final String stack;
  ErrorsToServer({
    required this.error,
    required this.stack,
  });

  Future<void> send() async {
    //DateTime now = new DateTime.now().toLocal();

    String? deviceInfo = await GetDeviceInfo.getSimpleInfo();

    if (deviceInfo != null) {
      //print(deviceInfo);
    }
  }
}
