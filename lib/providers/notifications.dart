import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ink_mobile/screens/initial/initial_screen.dart';

import '../app.dart';
import 'package:logging/logging.dart';

class NotificationsProvider {
  static final _logger = Logger('NotificationsProvider');

  static late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static final AndroidInitializationSettings _initializationSettingsAndroid =
      AndroidInitializationSettings('note_icon');
  static late IOSInitializationSettings _initializationSettingsIOS;
  static late MacOSInitializationSettings _initializationSettingsMacOS;
  static late InitializationSettings _initializationSettings;
  static late NotificationAppLaunchDetails? _notificationAppLaunchDetails;

  NotificationsProvider.init() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _initializationSettingsIOS =
        IOSInitializationSettings(); //onDidReceiveLocalNotification: onDidReceiveLocalNotification
    _initializationSettingsMacOS = MacOSInitializationSettings();
    initSettings();
  }

  Future<void> initSettings() async {
    _initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid,
      iOS: _initializationSettingsIOS,
      macOS: _initializationSettingsMacOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onSelectNotification: _handleSelections,
    );
    _notificationAppLaunchDetails = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
    if (_notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      final selectedNotificationPayload =
          _notificationAppLaunchDetails!.payload;
      selectNotification(selectedNotificationPayload);
    }
  }

  static Map<String, VoidCallback> listeners = {};

  void _handleSelections(String? payload) {
    listeners[payload]?.call();
  }

  Future<void> selectNotification(String? payload) async {
    if (payload != null) {
      _logger.info('notification payload: $payload');
    }
    await Navigator.push(
      App.materialKey!.currentContext!,
      MaterialPageRoute<void>(builder: (context) => InitPage()),
    );
  }

  static Future<void> showNotification(String title, String body,
      {int id = 0, String? payload, required VoidCallback onSelect}) async {
    final androidPlatformChannelSpecifics =
        getAndroidPlatformChannelSpecifics();
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    if (payload != null) {
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

  static AndroidNotificationDetails getAndroidPlatformChannelSpecifics() {
    return AndroidNotificationDetails(
      '3',
      'Regular notes #3',
      channelDescription: 'Regular notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
  }
}
