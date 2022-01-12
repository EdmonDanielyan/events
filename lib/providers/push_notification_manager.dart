import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

///
/// Background isolate for FCM. Usage in [PushNotificationManager.load] to configure FCM plugin
///
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await fcmIsolate(message);
}

Future<void> fcmIsolate(RemoteMessage message) async {
  setIsolateName('FCM');
  var logger = Logger('FCM');
  logger.finest("FirebaseMessaging.onBackgroundMessage: ${message.data}");
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final FlutterSecureStorage storage = FlutterSecureStorage();
    final String? jwtToken = await storage.read(key: 'token');
    final JwtPayload? jwtPayload = Token.parseJwtPayloadObject(jwtToken);
    final userId = jwtPayload!.userId.toString();
    logger.finest("FirebaseMessaging.userId: $userId");
    if (userId.isEmpty) {
      logger.warning("Not logged in app");
      return;
    }
    if (userId == message.data["user_id"]) {
      logger.finest("Skip own messages");
      return;
    }
    var localNotificationsProvider = LocalNotificationsProvider();
    await localNotificationsProvider.load();
    await localNotificationsProvider.showNotification(
        message.data['title'] ?? "ИНК",
        message.data['body'] ?? "Новое сообщение",
        id: message.hashCode,
        payload: message.data['chat_id'],
        onSelect: (_) {});
  }, (Object error, StackTrace stack) {
    Logger('firebaseMessagingBackgroundHandler')
        .severe('Unexpected error', error, stack);
  });
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
          id: _chat.id.hashCode,
          onSelect: (_) {
            OpenChat(sl(), _chat)();
          },
        );
      }
    }
  }

  Future<ChatTable?> get initialChat async {
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
    var chatId = message.data["chat_id"];
    return _getChatById(chatId);
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
