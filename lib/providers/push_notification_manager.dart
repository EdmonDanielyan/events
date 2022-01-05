
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/core/logging/logging.dart';
import 'package:ink_mobile/providers/notifications.dart';
import 'package:ink_mobile/setup.dart';
import 'package:logging/logging.dart';

import 'firebase_options.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  setIsolateName('FCM');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setup();
  var logger = Logger('firebaseMessagingBackgroundHandler');
  logger.warning("Start");
  var localNotificationsProvider = sl<LocalNotificationsProvider>();
  await localNotificationsProvider.load();
  logger.finest(()=> '''
    Push Notification Message
    title: ${message.notification?.title}
    body: ${message.notification?.body}
    data: ${message.data}
  ''');
}

@lazySingleton
class PushNotificationManager with Loggable {
  final LocalNotificationsProvider localNotificationsProvider;

  PushNotificationManager(this.localNotificationsProvider);

  Future subscribeToTopic(String topic) async {
    logger.finest(()=> "subscribeToTopic: $topic");
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  Future unsubscribeFromTopic(String topic) async {
    logger.finest(()=> "unsubscribeFromTopic: $topic");
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }

  Future load() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
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
}
