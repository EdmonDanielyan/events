import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
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
///
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

///
/// Wrap all tasks for Firebase Messaging aspects
///
@lazySingleton
class PushNotificationManager with Loggable {
  final LocalNotificationsProvider localNotificationsProvider;

  PushNotificationManager(this.localNotificationsProvider);

  Future load() async {
    // logger.finest('load');
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    // await FirebaseMessaging.instance.requestPermission(badge: true);
    // //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // if (!kIsWeb) {
    //   String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    //   logger.finest("FirebaseMessaging.apnsToken: $apnsToken");

    //   String? fcmToken = await FirebaseMessaging.instance.getToken();
    //   logger.finest("FirebaseMessaging.fcmToken: $fcmToken");
    // }

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    //   logger.finest("FirebaseMessaging.onMessage: ${message.data}");

    //   var userId = await Token.getUserId();
    //   if (userId.isEmpty) {
    //     logger.warning("Not logged in app");
    //     return;
    //   }
    //   await showNotificationIfNeeded(message);
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    //   try {
    //     logger.finest("FirebaseMessaging.onMessageOpenedApp: ${message.data}");

    //     final payload = ChatPushNotificationModel.fromRemoteMessage(message);
    //     logger.finest("payload: $payload");
    //     if (payload != null) {
    //       _openChat(payload);
    //     }
    //   } catch (e) {
    //     print(e.toString());
    //   }
    // });
  }

  Future<void> _openChat(ChatPushNotificationModel payload) async {
    logger.finest("_openChat");
    final _chat = await _getChatById(payload.chatId);
    logger.finest("_chat: $_chat");
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
          payload: _chat.id,
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

  Future subscribeToTopic(String topic) async {
    logger.finest(() => "subscribeToTopic: $topic");
    //await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  Future unsubscribeFromTopic(String topic) async {
    logger.finest(() => "unsubscribeFromTopic: $topic");
    try {
      //await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    } catch (e, s) {
      logger.severe("Error during FCM unsubscribe", e, s);
    }
  }
}
