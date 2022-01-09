import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/core/logging/logging.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';
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
  logger.finest(() => '''
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
    logger.finest(() => "subscribeToTopic: $topic");
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  Future unsubscribeFromTopic(String topic) async {
    logger.finest(() => "unsubscribeFromTopic: $topic");
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }

  Future load() async {
    logger.finest('load');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseMessaging.instance.requestPermission();

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
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      logger.finest("FirebaseMessaging.onMessage: $message");
      RemoteNotification? notification = message.notification;
      if (notification != null && !_isMyMessage(message)) {
        var _chat = await _getChatFromRemote(message);
        bool isChatOpened = sl<ChatDatabaseCubit>().getSelectedChatId == _chat?.id;
        if (_chat != null && !isChatOpened) {
          localNotificationsProvider.showNotification(
              notification.title ?? "ИНК",
              notification.body ?? "Новое сообщение",
              payload: _chat.id,
              id: message.hashCode,
              onSelect: (_) {
                OpenChat(sl(), _chat)();
              });
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      logger.finest("FirebaseMessaging.onMessageOpenedApp: $message");
    });

    String? token = await FirebaseMessaging.instance.getAPNSToken();
    print('FlutterFire Messaging Example: Got APNs token: $token');
  }

  Future<ChatTable?> get initialChat async {
    var remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage != null) {
      return _getChatFromRemote(remoteMessage);
    }
    return null;
  }

  Future<ChatTable?> _getChatFromRemote(RemoteMessage remoteMessage) async {
    var chatId = remoteMessage.data["chat_id"];
    if (chatId != null) {
      var databaseCubit = sl<ChatDatabaseCubit>();
      return await databaseCubit.db.selectChatById(chatId);
    }
    return null;
  }

  bool _isMyMessage(RemoteMessage remoteMessage) {
    var userId = remoteMessage.data["user_id"];
    return sl<TokenDataHolder>().userId == userId;
  }
}
