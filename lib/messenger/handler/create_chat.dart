import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ink_mobile/messenger/api/services/chat/create.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/hidden_chats/hidden_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/functions/create_chat.dart';
import 'package:ink_mobile/messenger/messenger/senders/invitation/invitation.dart';
import 'package:ink_mobile/messenger/messenger/senders/invitation/model.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat/opener.dart';
import 'package:ink_mobile/setup.dart';

class CreateChatHandler {
  final List<User> users;
  final BuildContext context;
  final bool open;
  final CachedChatsCubit chatsCubit;
  final OnlineCubit onlineCubit;
  final CachedUsersCubit cachedUsersCubit;
  const CreateChatHandler(
    this.users,
    this.context, {
    this.open = true,
    required this.chatsCubit,
    required this.onlineCubit,
    required this.cachedUsersCubit,
  });

  Future<void> call() async {
    final chat = CreateChat(users, chatsCubit.me)();

    final singleChat = chatsCubit.singleChatExists(chat.participants);

    if (singleChat != null) {
      getIt<HiddenChatsCubit>().remove(singleChat.id);
      chatsCubit.toSet();
      _open(singleChat);
      return;
    }

    final storedChat = chatsCubit.getChatById(chat.id);

    if (storedChat != null) {
      _open(storedChat);
      return;
    }

    await _makeRequest(chat);
  }

  Future<void> _makeRequest(Chat chat) async {
    EasyLoading.show();
    await CreateChatService(
      chat,
      successCallback: (chatApi, token) {
        final newChat = chatApi.copyWith(
          participants: chat.participants,
          name: chat.name,
          ownerId: chat.ownerId,
        );
        if (newChat.isGroup) {
          InvitationSender(InvitationSenderModel(chat: newChat, token: token))
              .call();
        }
        if (newChat.isSingle) {
          getIt<MessengerProvider>().subscribeToChat(newChat.id);
        }
        chatsCubit.addChats([newChat]);

        _open(newChat);
      },
      myId: chatsCubit.myId,
    ).call();
    EasyLoading.dismiss();
  }

  void _open(Chat chat) {
    if (open) {
      ChatScreenOpener(
        context,
        chat.id,
        chatsCubit,
        onlineCubit: onlineCubit,
        cachedUsersCubit: cachedUsersCubit,
      ).call();
    }
  }
}
