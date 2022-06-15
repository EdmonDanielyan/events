import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cubits/cached/base_url/base_url_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/handler/fetch/chat_list.dart';
import 'package:ink_mobile/messenger/handler/fetch/chats.dart';
import 'package:ink_mobile/messenger/messenger/listeners/add_participant.dart';
import 'package:ink_mobile/messenger/messenger/listeners/connect.dart';
import 'package:ink_mobile/messenger/messenger/listeners/delete_message.dart';
import 'package:ink_mobile/messenger/messenger/listeners/direct_message.dart';
import 'package:ink_mobile/messenger/messenger/listeners/disconnect.dart';
import 'package:ink_mobile/messenger/messenger/listeners/error.dart';
import 'package:ink_mobile/messenger/messenger/listeners/invite.dart';
import 'package:ink_mobile/messenger/messenger/listeners/listener.dart';
import 'package:ink_mobile/messenger/messenger/listeners/message.dart';
import 'package:ink_mobile/messenger/messenger/listeners/online_listener.dart';
import 'package:ink_mobile/messenger/messenger/listeners/read_message_listener.dart';
import 'package:ink_mobile/messenger/messenger/listeners/remove_participant.dart';
import 'package:ink_mobile/messenger/messenger/listeners/update_chat_listener.dart';
import 'package:ink_mobile/messenger/messenger/listeners/update_message.dart';
import 'package:ink_mobile/messenger/messenger/senders/online/model.dart';
import 'package:ink_mobile/messenger/messenger/senders/online/online_sender.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/providers/socket.io.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/setup.dart';
import 'package:socket_io_client/socket_io_client.dart';

@singleton
class MessengerProvider {
  MessengerProvider();

  Socket? socket;

  bool disposed = true;

  Set<int> subscribedChats = {};
  Set<int> listiningChats = {};
  Set<int> onlineSubscriptions = {};
  bool isListiningToChat(int chatId) => listiningChats.contains(chatId);
  CachedChatsCubit get cachedChatsCubit => getIt<CachedChatsCubit>();
  Timer? onlineTimer;

  void init(
    String url,
    int userId, {
    required String apiUrl,
  }) {
    if (disposed) {
      User user = User(
        id: JwtPayload.myId,
        name: JwtPayload.myName,
        avatarUrl: JwtPayload.myAvatar,
      );

      cachedChatsCubit.updateMe(user);

      getIt<BaseUrlCubit>().setNewUrl(apiUrl);
      final connectListener = getIt<ConnectListener>();
      socket = SocketProvider(
        url,
        onConnect: connectListener.handler,
        onConnectError: connectListener.onError,
        onDisconnect: getIt<DisconnectListener>().handler,
        onError: getIt<ErrorListener>().handler,
        handlers: [
          getIt<InviteListener>()..id = userId,
          getIt<DirectMessageListener>()..userId = userId,
        ],
      ).init();
      subscribeToChats();
      _sendOnline(cachedChatsCubit.me);
      const FetchChats().call();
      const FetchChatList().call();

      disposed = false;
    }
  }

  void addListener(Listener listener) {
    socket?.on(listener.event, listener.handler);
  }

  void subscribeToChats() {
    final cubit = cachedChatsCubit;

    if (cubit.chats.isNotEmpty) {
      for (final chat in cubit.chats) {
        subscribeToChat(chat.id);
      }
    }
  }

  void subscribeToChat(int chatId) {
    if (!subscribedChats.contains(chatId)) {
      addListener(MessageListener(chatId));
      addListener(RemoveParticipantListener(chatId));
      addListener(AddParticipantListener(chatId));
      addListener(DeleteMessageListener(chatId));
      addListener(UpdateMessageListener(chatId));
      addListener(UpdateChatListener(chatId));
      addListener(ReadMessageListener(chatId));

      subscribedChats.add(chatId);
    }
    listiningChats.add(chatId);
  }

  void unsubscribeFromChat(int chatId) {
    if (listiningChats.contains(chatId)) {
      listiningChats.remove(chatId);
    }
  }

  void _sendOnline(User user) {
    onlineTimer = Timer.periodic(
      const Duration(seconds: 20),
      (timer) {
        OnlineSender(OnlineModel(user: user)).call();
      },
    );
  }

  void subscribeOnline(int userId) {
    if (!onlineSubscriptions.contains(userId)) {
      addListener(OnlineListener(userId));
      onlineSubscriptions.add(userId);
    }
  }

  void dispose() {
    onlineTimer?.cancel();
    socket?.dispose();
    subscribedChats = {};
    onlineSubscriptions = {};
    listiningChats = {};
    disposed = true;
  }
}
