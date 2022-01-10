import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
///
/// Wrapper for Local Notification
///
///
@lazySingleton
class LocalNotificationsProvider with Loggable {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  Future<void> load() async {
    logger.finest('load');
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var _initializationSettingsIOS = IOSInitializationSettings(
        requestBadgePermission: false, defaultPresentBadge: false);
    var _initializationSettingsAndroid =
        AndroidInitializationSettings('note_icon');
    var _initializationSettingsMacOS = MacOSInitializationSettings();
    var _initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid,
      iOS: _initializationSettingsIOS,
      macOS: _initializationSettingsMacOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onSelectNotification: _handleSelections,
    );
    var _notificationAppLaunchDetails = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
    if (_notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      logger.finest('App was launch from notification');
      final selectedNotificationPayload =
          _notificationAppLaunchDetails!.payload;
      selectNotification(selectedNotificationPayload);
    }
  }

  Map<String, void Function(String?)> listeners = {};

  void _handleSelections(String? payload) {
    logger.finest('_handleSelections');
    listeners[payload]?.call(payload);
  }

  Future<void> selectNotification(String? payload) async {
    if (payload != null) {
      logger.info(() => 'notification payload: $payload');
      var secureStorage = sl<SecureStorage>();
      await secureStorage.write(key: "open_chat_id", value: payload);
    }
  }

  Future<void> showNotification(String title, String body,
      {String? payload, Function(String?)? onSelect, int id = 0}) async {
    logger.finest(() =>
        "showNotification. title: $title, body: $body, payload: $payload");
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '3',
      'Regular notes #3',
      channelDescription: 'Regular notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    final iosNotificationDetails = IOSNotificationDetails(
      presentBadge: false,
      badgeNumber: 0,
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
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
}
