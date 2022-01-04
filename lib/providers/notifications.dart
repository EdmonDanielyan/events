import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/screens/initial/initial_screen.dart';
import 'package:ink_mobile/setup.dart';

import '../app.dart';

@lazySingleton
class LocalNotificationsProvider with Loggable {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  Future<void> load() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var _initializationSettingsIOS =
        IOSInitializationSettings(); //onDidReceiveLocalNotification: onDidReceiveLocalNotification
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
      final selectedNotificationPayload =
          _notificationAppLaunchDetails!.payload;
      selectNotification(selectedNotificationPayload);
    }
  }

  Map<String, VoidCallback> listeners = {};

  void _handleSelections(String? payload) {
    listeners[payload]?.call();
  }

  Future<void> selectNotification(String? payload) async {
    if (payload != null) {
      logger.info(() => 'notification payload: $payload');
    }

    if (App.getContext == null) return;

    await Navigator.push(
      App.materialKey!.currentContext!,
      MaterialPageRoute<void>(
          builder: (context) => InitPage(
                cubit: sl()..load(),
              )),
    );
  }

  Future<void> showNotification(String title, String body,
      {int id = 0, String? payload, required VoidCallback onSelect}) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '3',
      'Regular notes #3',
      channelDescription: 'Regular notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

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
}
