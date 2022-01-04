import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/providers/notifications.dart';

import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('Handling a background message ${message.messageId}');
}

@lazySingleton
class PushNotificationManager with Loggable {
  final LocalNotificationsProvider localNotificationsProvider;

  PushNotificationManager(this.localNotificationsProvider);

  Future subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  Future unsubscribeFromTopic(String topic) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }

  Future load() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    if (!kIsWeb) {
      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.finest("FirebaseMessaging.onMessage: $message");
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        localNotificationsProvider.showNotification(
            notification.title ?? "ИНК",
            notification.body ?? "Новое сообщение", onSelect: () {});
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      logger.finest("FirebaseMessaging.onMessageOpenedApp: $message");
    });
  }

  Future<void> sendPushMessage() async {
    logger.finest("sendPushMessage");
    var _token = await FirebaseMessaging.instance.getToken();
    if (_token == null) {
      logger.warning('Unable to send FCM message, no token exists.');
      return;
    }


    String accessToken = "";
    try {
      var payload = _constructFCMPayload(_token);
      var response = await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        },
        body: payload,
      );
      logger.info(() =>'FCM request payload: $payload');
      logger.info(() => 'FCM response: ${response.body}');
    } catch (e, s) {
      logger.severe("Error during post push message", e, s);
    }
  }

  /// The API endpoint here accepts a raw FCM payload for demonstration purposes.
  String _constructFCMPayload(String? token) {
    return jsonEncode({
      'token': token,
      'data': {
        'via': 'FlutterFire Cloud Messaging!!!',
        'count': '0',
      },
      'notification': {
        'title': 'Hello FlutterFire!',
        'body': 'This notification was created via FCM!',
      },
    });
  }

}
