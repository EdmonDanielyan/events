import 'package:ink_mobile/messenger/providers/notifications.dart';
import 'package:ink_mobile/setup.dart';

class CloseNotification {
  final int id;
  const CloseNotification(this.id);

  void call() {
    final localNotificationsProvider = getIt<LocalNotificationsProvider>();

    localNotificationsProvider.cancelNotification(id);
  }
}
