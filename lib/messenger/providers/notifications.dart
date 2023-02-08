import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalNotificationsProvider {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  Future<void> load() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var _initializationSettingsIOS = const IOSInitializationSettings(
      requestBadgePermission: false,
      defaultPresentBadge: false,
      requestAlertPermission: true,
    );
    var _initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_stat_onesignal_default');
    var _initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid,
      iOS: _initializationSettingsIOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onSelectNotification: _handleSelections,
    );
    var _notificationAppLaunchDetails = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
    if (_notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      final selectedNotificationPayload =
          _notificationAppLaunchDetails!.payload;
      selectNotification(selectedNotificationPayload);
    }
  }

  Map<String, void Function(String?)> listeners = {};

  void _handleSelections(String? payload) {
    listeners[payload]?.call(payload);
  }

  Future<void> selectNotification(String? payload) async {
    // if (payload != null) {
    //   logger.info(() => 'notification payload: $payload');
    //   var secureStorage = getIt<SecureStorage>();
    //   await secureStorage.write(key: "open_chat_id", value: payload);
    // }
  }

  Future<void> showNotification(
    String title,
    String body, {
    String? payload,
    Function(String?)? onSelect,
    int id = 0,
  }) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '3',
      'Regular notes #3',
      channelDescription: 'Regular notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const iosNotificationDetails = IOSNotificationDetails(
      presentBadge: false,
      presentAlert: true,
      badgeNumber: 0,
    );

    NotificationDetails platformChannelSpecifics = const NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

    if (payload != null && onSelect != null) {
      listeners[payload] = onSelect;
    }

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
