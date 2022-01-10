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
  setIsolateName('FCM');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setup();
  var logger = Logger('firebaseMessagingBackgroundHandler');
  logger.finest("FirebaseMessaging.onBackgroundMessage: ${message.data}");
  var localNotificationsProvider = sl<LocalNotificationsProvider>();
  await localNotificationsProvider.load();
  localNotificationsProvider.showNotification(
      message.data['title'] ?? "ИНК", message.data['body'] ?? "Новое сообщение",
      id: message.hashCode,
      payload: message.data['chat_id'], onSelect: (_) {});
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

    await FirebaseMessaging.instance.requestPermission(badge: false);
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    if (!kIsWeb) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: false,
        sound: true,
      );
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      logger.finest("FirebaseMessaging.onMessage: ${message.data}");
      await showNotificationIfNeeded(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      logger.finest("FirebaseMessaging.onMessageOpenedApp: ${message.data}");
    });

    String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    logger.finest("FirebaseMessaging.apnsToken: $apnsToken");

    String? fcmToken = await FirebaseMessaging.instance.getToken();
    logger.finest("FirebaseMessaging.fcmToken: $fcmToken");
  }

  bool _isMyMessage(RemoteMessage remoteMessage) {
    var userId = remoteMessage.data["user_id"];
    return sl<TokenDataHolder>().userId == userId;
  }

  Future<void> showNotificationIfNeeded(RemoteMessage message) async {
    if (!_isMyMessage(message)) {
      var _chat = await _getChatFromRemote(message);
      bool isChatOpened =
          sl<ChatDatabaseCubit>().getSelectedChatId == _chat?.id;
      if (_chat != null && !isChatOpened) {
        var localNotificationsProvider = sl<LocalNotificationsProvider>();
        await localNotificationsProvider.load();
        localNotificationsProvider.showNotification(
            message.data['title'] ?? "ИНК",
            message.data['body'] ?? "Новое сообщение",
            payload: _chat.id,
            id: message.hashCode, onSelect: (_) {
          OpenChat(sl(), _chat)();
        });
      }
    }
  }

  Future<ChatTable?> get initialChat async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      return _getChatFromRemote(message);
    }
    return null;
  }

  Future<ChatTable?> _getChatFromRemote(RemoteMessage message) async {
    var chatId = message.data["chat_id"];
    if (chatId != null) {
      var databaseCubit = sl<ChatDatabaseCubit>();
      return await databaseCubit.db.selectChatById(chatId);
    }
    return null;
  }
}
