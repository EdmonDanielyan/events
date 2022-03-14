import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/online/online_bloc.dart';
import 'package:ink_mobile/messenger/cases/channel_functions.dart';
import 'package:ink_mobile/messenger/cases/chat_creation.dart';
import 'package:ink_mobile/messenger/cases/chat_functions.dart';
import 'package:ink_mobile/messenger/cases/user_functions.dart';
import 'package:ink_mobile/messenger/listeners/channels_registry.dart';
import 'package:ink_mobile/messenger/listeners/chat_list.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/providers/notifications/push_notification_manager.dart';
import 'package:ink_mobile/messenger/sender/chat_events.dart';
import 'package:ink_mobile/messenger/sender/chat_saver.dart';
import 'package:ink_mobile/messenger/sender/invite_sender.dart';
import 'package:ink_mobile/messenger/sender/message_editor_sender.dart';
import 'package:ink_mobile/messenger/sender/online_sender.dart';
import 'package:ink_mobile/messenger/sender/text_sender.dart';
import 'package:ink_mobile/messenger/sender/user_reaction_sender.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/providers/version_provider.dart';

import '../../setup.dart';
import '../constants/nats_constants.dart';

@lazySingleton
class Messenger with Loggable {
  late ChatDatabaseCubit chatDatabaseCubit;
  late NatsProvider natsProvider;
  late ChatFunctions chatFunctions;
  late OnlineBloc onlineBloc;
  late InviteSender inviteSender;
  late ChatEventsSender chatEventsSender;
  late MessageEditorSender messageEditorSender;
  late OnlineSender onlineSender;
  late TextSender textSender;
  late UserReactionSender userReactionSender;
  late ChatSaver chatSaver;

  late ChatCreation chatCreation;
  late UserFunctions userFunctions;
  late ChannelsRegistry registry;
  late ChannelFunctions channelFunctions;
  late ChatListListener chatListListener;
  late ChatCubit chatCubit;
  late PushNotificationManager pushNotificationManager;
  int disconnectCounter = 0;
  DateTime lastDisconnect = DateTime(0);

  bool get isConnected => natsProvider.isConnected;

  Future<void> _versionMigration() async {
    final versionProvider = VersionProvider(sl<PackageInfoProvider>());
    final currentVersion = versionProvider.currentVersion;
    final storedVersion = await versionProvider.storedVersion;
    if (storedVersion == null || currentVersion != storedVersion) {
      logger.finest(''' 
      DELETING EVERYTHING WITH VERSION MIGRATION TO $currentVersion
      ''');
      try {
        await chatDatabaseCubit.db.deleteEverything();
        await versionProvider.setToStore(versionProvider.currentVersion);
      } catch (_e) {
        //FOR POTENTIAL DB SCHEMA ERRORS
        logger.warning(
            "DB SCHEME ERROR ${_e.toString()} WHILE DOING VERSION MIGRATION $currentVersion");
      }
    }
  }

  Future<void> init() async {
    String? refreshToken = await Token.getRefresh();
    if (refreshToken != null) {
      logger.finest("init");
      await sl<TokenDataHolder>().update();
      this.natsProvider = sl();
      if (this.natsProvider.isDisposed) {
        throw "Using disposable NATS Provider is prohibited";
      }
      this.chatDatabaseCubit = sl();
      this.chatCubit = sl();
      this.userFunctions = sl();
      this.messageEditorSender = sl();
      this.userReactionSender = sl();
      this.chatSaver = sl();
      this.chatFunctions = sl();
      this.inviteSender = sl();
      this.chatEventsSender = sl();
      this.textSender = sl();
      this.registry = sl();
      this.chatCreation = sl();
      this.onlineSender = sl();
      this.onlineBloc = sl();
      this.pushNotificationManager = sl<PushNotificationManager>();
      _configureNatsProvider();

      await natsProvider.load();
    }
  }

  Future<void> _configureNatsProvider() async {
    logger.finest("_configureNatsProvider");
    natsProvider.onConnected = () async {
      messengerConnect();
    };

    natsProvider.onDisconnected = () async {
      logger.info("onDisconnected");
      _onDisconnect();
      softDispose();
    };

    natsProvider.onUnacknowledged = (subscription, message, onMessage) async {
      registry.onUnackMessages(subscription, message);
    };
  }

  void _onDisconnect() {
    if (!natsProvider.isDisposed) {
      disconnectCounter++;
      if (disconnectCounter > SHOW_ALERT_WHEN_DISCONNECT_COUNT_GREATER_THEN) {
        disconnectCounter = 0;
        _showRestrictedAlert();
      }

      _disconnectCleaner.run(() {
        disconnectCounter = 0;
      });
    }
  }

  Debouncer _disconnectCleaner = Debouncer(milliseconds: 1000*60);

  Future<void> messengerConnect() async {
    logger.finest("messengerConnect start");

    await natsProvider.auth(
        login: sl.get(instanceName: "messengerAuthLogin"),
        password: sl.get(instanceName: "messengerAuthPassword"));

    await _versionMigration();
    registry.listenToAllMessages();
    await userFunctions.addMe();
    await registry.init();
    onlineSender.sendUserOnlinePing();
    await textSender.redeliverMessages();
    logger.finest("messengerConnect end");
  }

  void _showRestrictedAlert() {
    final context = App.getContext;
    if (context != null) {
        SimpleCustomSnackbar(
          duration: Duration(seconds: 3),
            context: context, txt: localizationInstance.messenger_in_limited_mode);
    }
  }


  Future<void> softDispose() async {
    logger.finest('_softDispose');
    registry.unsubscribeFromAll(includePush: false);
    natsProvider.clear();
    chatDatabaseCubit.db.clearCache();
    onlineSender.stopSending();
  }

  Future<void> dispose() async {
    logger.finest('dispose');
    disconnectCounter = 0;
    chatDatabaseCubit.db.clearCache();
    registry.unsubscribeFromAll(includePush: true);
    onlineSender.stopSending();
    await natsProvider.dispose();
  }
}
