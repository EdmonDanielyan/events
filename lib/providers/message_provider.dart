import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
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
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../app.dart';
import '../setup.dart';

class UseMessageProvider {
  static late bool initialized = false;
  static late MessageProvider? messageProvider;

  static Future<bool> initMessageProvider(
      ChatDatabaseCubit chatDatabaseCubit) async {
    await _initNatsProvider();
    messageProvider = sl<MessageProvider>();
    initialized = true;
    await messageProvider!.init();
    return true;
  }

  static Future<NatsProvider> _initNatsProvider() async {
    await sl<TokenDataHolder>().update();
    NatsProvider natsProvider = sl<NatsProvider>();
    return natsProvider;
  }

  static void uninit() {
    initialized = false;
    messageProvider = null;
  }
}

@lazySingleton
class MessageProvider {
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

  MessageProvider();

  bool natsLoaded = false;
  int connectionsCount = 0;

  Future<void> init() async {
    this.natsProvider = sl();
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
    _listenToConnection();
    natsLoaded = await natsProvider.load();
  }

  Future<void> _listenToConnection() async {
    natsProvider.onConnected = () async {
      connectionsCount++;
      await _onConnected();
      if (connectionsCount == 1) {
        textSender.redeliverMessages();
      }
      _showConnectedSnackBar();
    };

    natsProvider.onDisconnected = () async {
      _showDisconnectedSnackBar();
    };
  }

  void _showConnectedSnackBar() {
    if (connectionsCount > 1 && App.getContext != null) {
      SuccessCustomSnackbar(
        context: App.getContext!,
        txt: localizationInstance.connectedToServer,
      );
    }
  }

  void _showDisconnectedSnackBar() {
    if (App.getContext != null) {
      SimpleCustomSnackbar(
        context: App.getContext!,
        txt: localizationInstance.disconnectedFromServer,
      );
    }
  }

  Future<void> _onConnected() async {
    if (!natsLoaded) {
      natsLoaded = true;
      userFunctions.addMe();
      registry.listenToAllMessages();
      await registry.init();
      pingSender.sendUserOnlinePing(user: userFunctions.me);
    }
  }

  Future<void> dispose() async {
    registry.unsubscribeFromAll();
    pingSender.stopSending();
    await natsProvider.dispose();
    await chatDatabaseCubit.db.deleteEverything();
    UseMessageProvider.uninit();
    natsLoaded = false;
  }

  Future<void> subscribeToUserOnline(UserTable user) async {
    final listener =
        (registry.listeners[MessageType.Online] as UserOnlineListener?);
    if (listener != null) {
      await listener.subscribe(user);
    } else {
      Future.delayed(Duration(seconds: 3), () {
        subscribeToUserOnline(user);
      });
    }
  }
}
