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
import 'package:ink_mobile/models/token.dart';

import '../../setup.dart';

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

  bool get isConnected => natsProvider.isConnected;

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
      natsConnect();
    };

    natsProvider.onDisconnected = () async {
      logger.info("onDisconnected");
      softDispose();
      _showPopup(false);
    };

    natsProvider.onUnacknowledged = (subscription, message, onMessage) async {};
  }

  Future<void> natsConnect() async {
    logger.info("onConnected");
    await natsProvider.auth(
        login: sl.get(instanceName: "messengerAuthLogin"),
        password: sl.get(instanceName: "messengerAuthPassword"));
    textSender.redeliverMessages();
    await _onConnected();
    _showPopup(true);
  }

  void _showPopup(bool connected) {
    final context = App.getContext;
    if (context != null) {
      if (connected) {
        SuccessCustomSnackbar(
            context: context, txt: localizationInstance.connectedToServer);
      } else {
        SimpleCustomSnackbar(
            context: context, txt: localizationInstance.disconnectedFromServer);
      }
    }
  }

  Future<void> _onConnected() async {
    //await Future.delayed(Duration(seconds: 1));
    logger.finest('_onConnected');
    registry.listenToAllMessages();
    await userFunctions.addMe();
    await registry.init();
    onlineSender.sendUserOnlinePing();
  }

  Future<void> softDispose() async {
    logger.finest('_softDispose');
    registry.unsubscribeFromAll(includePush: false);
    onlineSender.stopSending();
  }

  Future<void> dispose() async {
    logger.finest('dispose');
    registry.unsubscribeFromAll(includePush: true);
    onlineSender.stopSending();
    await natsProvider.dispose();
  }
}
