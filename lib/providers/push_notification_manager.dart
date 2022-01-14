import 'dart:async';
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/push_notification_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/notifications.dart';
import 'package:ink_mobile/setup.dart';

import 'firebase_options.dart';

///
/// Background isolate for FCM. Usage in [PushNotificationManager.load] to configure FCM plugin
///
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("WHILE BACKGROUND");
  print(message);
}

///
/// Wrap all tasks for Firebase Messaging aspects
///
///
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
    try {
      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    } catch (e, s) {
      logger.severe("Error during FCM unsubscribe", e, s);
    }
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
      var userId = await Token.getUserId();
      if (userId.isEmpty) {
        logger.warning("Not logged in app");
        return;
      }
      await showNotificationIfNeeded(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      final payload = ChatPushNotificationModel.fromRemoteMessage(message);
      if (payload != null) {
        _openChat(payload);
      }
      logger.finest("FirebaseMessaging.onMessageOpenedApp: ${message.data}");
    });

    String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    logger.finest("FirebaseMessaging.apnsToken: $apnsToken");

    String? fcmToken = await FirebaseMessaging.instance.getToken();
    logger.finest("FirebaseMessaging.fcmToken: $fcmToken");

    _notificationsListener();
  }

  void _notificationsListener() {
    AwesomeNotifications()
        .actionStream
        .listen((ReceivedNotification receivedNotification) {
      if (receivedNotification.payload != null) {
        try {
          final payload = ChatPushNotificationModel.fromMapString(
              receivedNotification.payload!);
          _openChat(payload);
        } catch (_e) {
          print(_e.toString());
          //PARSING ERROR
        }
      }
    });
  }

  Future<void> _openChat(ChatPushNotificationModel payload) async {
    final _chat = await _getChatById(payload.chatId);
    if (_chat != null) {
      OpenChat(sl(), _chat)();
    }
  }

  bool _isMyMessage(String userId) {
    return sl<TokenDataHolder>().userId == userId;
  }

  Future<void> showNotificationIfNeeded(RemoteMessage message) async {
    logger.finest('showNotificationIfNeeded');
    final data = ChatPushNotificationModel.fromRemoteMessage(message);
    if (data != null && !_isMyMessage(data.userId.toString())) {
      var _chat = await _getChatById(data.chatId);
      bool isChatOpened =
          sl<ChatDatabaseCubit>().getSelectedChatId == _chat?.id;

      if (_chat != null && !isChatOpened) {
        var localNotificationsProvider = sl<LocalNotificationsProvider>();
        localNotificationsProvider.showNotification(
          data.title,
          data.body,
          payload: data.toMapString(),
          id: _chat.id.hashCode,
          onSelect: (_) {
            OpenChat(sl(), _chat)();
          },
        );
      }
    }
  }

  Future<ChatTable?> get initialChatd async {
    logger.finest('initialChat');
    var message = await FirebaseMessaging.instance.getInitialMessage();
    logger.finest('Remote initial message: $message');
    if (message != null) {
      return _getChatFromRemote(message);
    } else {
      var openChatId = await sl<SecureStorage>().read("open_chat_id");
      logger.finest("openChatId: $openChatId");
      if (openChatId != null && openChatId.isNotEmpty) {
        await sl<SecureStorage>().write(key: "open_chat_id", value: "");
        return _getChatById(openChatId);
      }
    }
    return null;
  }

  Future<ChatTable?> _getChatFromRemote(RemoteMessage message) async {
    logger.finest("_getChatFromRemote");
    try {
      final data = ChatPushNotificationModel.fromRemoteMessage(message);
      if (data == null) {
        throw "error";
      }
      return _getChatById(data.chatId);
    } catch (_) {
      return null;
    }
  }

  Future<ChatTable?> _getChatById(chatId) async {
    logger.finest("_getChatById chatId: $chatId");
    if (chatId != null) {
      var databaseCubit = sl<ChatDatabaseCubit>();
      var chatTable = await databaseCubit.db.selectChatById(chatId);
      logger.finest(() => "found chat: $chatTable");
      return chatTable;
    }
  }
}
