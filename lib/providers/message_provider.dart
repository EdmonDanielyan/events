import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/channels_registry.dart';
import 'package:ink_mobile/functions/chat/listeners/chat_list.dart';
import 'package:ink_mobile/functions/chat/listeners/online.dart';
import 'package:ink_mobile/functions/chat/sender/chat_events.dart';
import 'package:ink_mobile/functions/chat/sender/chat_saver.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/functions/chat/sender/message_editor_sender.dart';
import 'package:ink_mobile/functions/chat/sender/ping_sender.dart';
import 'package:ink_mobile/functions/chat/sender/text_sender.dart';
import 'package:ink_mobile/functions/chat/sender/user_reaction_sender.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../setup.dart';

@lazySingleton
class Messenger with Loggable {
  late ChatDatabaseCubit chatDatabaseCubit;
  late NatsProvider natsProvider;
  late ChatFunctions chatFunctions;

  late InviteSender inviteSender;
  late ChatEventsSender chatEventsSender;
  late MessageEditorSender messageEditorSender;
  late PingSender pingSender;
  late TextSender textSender;
  late UserReactionSender userReactionSender;
  late ChatSaver chatSaver;

  late ChatCreation chatCreation;
  late UserFunctions userFunctions;
  late ChannelsRegistry registry;
  late ChannelFunctions channelFunctions;
  late ChatListListener chatListListener;
  late ChatCubit chatCubit;

  //todo: нужно убрать из месенджера все вызовы UI
  bool silentMode = false;

  bool isConnected = false;

  Future<void> init() async {
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
    this.pingSender = sl();
    _configureNatsProvider();
    isConnected = await natsProvider.load();
  }

  void _configureNatsProvider() {
    logger.finest("_configureNatsProvider");
    natsProvider.onConnected = () async {
      logger.info("onConnected");

      textSender.redeliverMessages();
      await _onConnected();
    };

    natsProvider.onDisconnected = () async {
      logger.info("onDisconnected");
      _softDispose();
    };

    natsProvider.onUnacknowledged = (subscription, message, onMessage) async {};
  }

  Future<void> _onConnected() async {
    //await Future.delayed(Duration(seconds: 1));
    logger.finest('_onConnected');
    isConnected = true;
    registry.listenToAllMessages();
    await userFunctions.addMe();
    await registry.init();
    pingSender.sendUserOnlinePing(user: userFunctions.me);
  }

  Future<void> _softDispose() async {
    logger.finest('_softDispose');
    registry.unsubscribeFromAll();
    pingSender.stopSending();
  }

  Future<void> dispose() async {
    logger.finest('dispose');
    registry.unsubscribeFromAll();
    pingSender.stopSending();
    await natsProvider.dispose();
    isConnected = false;
  }

  Future<void> subscribeToUserOnline(UserTable user) async {
    logger.finest(()=>'subscribeToUserOnline: id=${user.id} name=${user.name}');
    final listener =
        (registry.listeners[MessageType.Online] as UserOnlineListener?);
    if (listener != null) {
      await listener.subscribeIndividually(user);
    } else {
      await Future.delayed(Duration(seconds: 3), () async {
        await subscribeToUserOnline(user);
      });
    }
  }
}
