import 'dart:async';

import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/functions/chat/listeners/chat.dart';
import 'package:ink_mobile/functions/chat/listeners/chat_info.dart';
import 'package:ink_mobile/functions/chat/listeners/chat_list.dart';
import 'package:ink_mobile/functions/chat/listeners/delete_message.dart';
import 'package:ink_mobile/functions/chat/listeners/invitation.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/joined.dart';
import 'package:ink_mobile/functions/chat/listeners/left.dart';
import 'package:ink_mobile/functions/chat/listeners/message_status.dart';
import 'package:ink_mobile/functions/chat/listeners/online.dart';
import 'package:ink_mobile/functions/chat/listeners/texting.dart';
import 'package:ink_mobile/functions/chat/sender/send_system_message.dart';
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
    final natsProvider = await _initNatsProvider();
    messageProvider = MessageProvider(natsProvider, chatDatabaseCubit);
    initialized = true;
    messageProvider!.init();
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

class MessageProvider {
  final ChatDatabaseCubit chatDatabaseCubit;
  final NatsProvider natsProvider;
  late ChatFunctions chatFunctions;
  late ChatInvitationListener chatInvitationListener;
  late ChatMessageListener chatMessageListener;
  late ChatSendMessage chatSendMessage;
  late ChatCreation chatCreation;
  late UserFunctions userFunctions;
  late NatsListener natsListener;
  late ChannelFunctions channelFunctions;
  late MessageStatusListener messageStatusListener;
  late MessageTextingListener messageTextingListener;
  late ChatJoinedListener chatJoinedListener;
  late ChatLeftListener chatLeftListener;
  late MessageDeletedListener messageDeletedListener;
  late ChatInfoListener chatInfoListener;
  late UserOnlineListener userOnlineListener;
  late ChatListListener chatListListener;
  late ChatCubit chatCubit;

  MessageProvider(this.natsProvider, this.chatDatabaseCubit) {
    this.chatCubit = sl<ChatCubit>();
    this.userFunctions = UserFunctions(chatDatabaseCubit);
    this.channelFunctions = ChannelFunctions(chatDatabaseCubit);
    this.chatFunctions = ChatFunctions(chatDatabaseCubit);
    this.chatSendMessage = ChatSendMessage(natsProvider);
    this.chatListListener = ChatListListener(
      natsProvider: natsProvider,
      chatDatabaseCubit: chatDatabaseCubit,
      userFunctions: userFunctions,
      channelFunctions: channelFunctions,
    );
    this.userOnlineListener = UserOnlineListener(
      messageProvider: this,
      natsProvider: natsProvider,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.messageDeletedListener = MessageDeletedListener(
      messageProvider: this,
      natsProvider: natsProvider,
      chatFunctions: chatFunctions,
    );
    this.chatInfoListener = ChatInfoListener(
      messageProvider: this,
      natsProvider: natsProvider,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.chatJoinedListener = ChatJoinedListener(
      messageProvider: this,
      natsProvider: natsProvider,
      userFunctions: userFunctions,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.chatLeftListener = ChatLeftListener(
      messageProvider: this,
      natsProvider: natsProvider,
      userFunctions: userFunctions,
      chatFunctions: chatFunctions,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.messageStatusListener = MessageStatusListener(
      natsProvider: natsProvider,
      chatFunctions: chatFunctions,
    );
    this.messageTextingListener = MessageTextingListener(
      natsProvider: natsProvider,
      chatDatabaseCubit: chatDatabaseCubit,
      chatCubit: chatCubit,
    );
    this.chatMessageListener = ChatMessageListener(
      natsProvider: natsProvider,
      userFunctions: userFunctions,
      chatDatabaseCubit: chatDatabaseCubit,
      chatSendMessage: chatSendMessage,
      messageProvider: this,
    );
    this.chatInvitationListener = ChatInvitationListener(
      messageProvider: this,
      natsProvider: natsProvider,
      chatSendMessage: chatSendMessage,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.natsListener = NatsListener(
      natsProvider: natsProvider,
      channelFunctions: channelFunctions,
      chatMessageListener: chatMessageListener,
      chatInvitationListener: chatInvitationListener,
      messageStatusListener: messageStatusListener,
      messageTextingListener: messageTextingListener,
      chatJoinedListener: chatJoinedListener,
      chatLeftListener: chatLeftListener,
      messageDeletedListener: messageDeletedListener,
      chatInfoListener: chatInfoListener,
      chatListListener: chatListListener,
    );
    this.chatCreation = ChatCreation(chatDatabaseCubit);
  }

  bool natsLoaded = false;
  int connectionsCount = 0;

  Future<void> init() async {
    _listenToConnection();
    natsLoaded = await natsProvider.load();
  }

  Future<void> _listenToConnection() async {
    natsProvider.onConnected = () async {
      connectionsCount++;
      await _onConnected();
      if (connectionsCount == 1) {
        _redeliverUnsentMessages();
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
      UserFunctions(chatDatabaseCubit).addMe();
      natsListener.listenToAllMessages();
      natsListener.init();
      userOnlineListener.sendUserOnlinePing();
    }
  }

  void _redeliverUnsentMessages() {
    chatMessageListener.redeliverMessages();
  }

  Future<void> dispose() async {
    natsListener.unsubscribeFromAll();
    userOnlineListener.stopSending();
    await natsProvider.dispose();
    await chatDatabaseCubit.db.deleteEverything();
    UseMessageProvider.uninit();
  }

  Future<void> subscribeToUserOnline(UserTable user) async {
    await userOnlineListener.listenTo(user);
  }

  Future<void> saveChats({
    required ChatTable? newChat,
    List<ChatTable>? chats,
    int? userId,
  }) async {
    chats = chats ?? await chatDatabaseCubit.db.getAllChats();
    final users = await chatDatabaseCubit.db.getAllUsers();
    final participants = await chatDatabaseCubit.db.getAllParticipants();
    final messages = await chatDatabaseCubit.db.getAllMessages();
    final channels = await chatDatabaseCubit.db.getAllChannels();

    if (newChat != null) {
      for (int i = 0; i < chats.length; i++) {
        if (chats[i].id == newChat.id) {
          chats.removeAt(i);
        }
      }

      chats.add(newChat);
    }

    await chatSendMessage.saveToPrivateUserChatIdList(
      userId: userId ?? JwtPayload.myId,
      users: users,
      chats: chats,
      participants: participants,
      messages: messages,
      channels: channels,
    );
  }
}
