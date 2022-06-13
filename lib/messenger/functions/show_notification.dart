import 'package:flutter/material.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/app_state/app_state.dart';
import 'package:ink_mobile/messenger/cubits/custom/app_state/app_state_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/providers/notifications.dart';
import 'package:ink_mobile/messenger/screens/chat/opener.dart';
import 'package:ink_mobile/setup.dart';

class ShowNotification {
  final Message message;

  const ShowNotification(this.message);

  void call() {
    final chatsCubit = getIt<CachedChatsCubit>();
    final appState = getIt<AppStateCubit>();

    final selectedChat = chatsCubit.selectedChats.isNotEmpty
        ? chatsCubit.selectedChats.last
        : null;

    if (selectedChat != null &&
        selectedChat.id == message.chatId &&
        appState.currentState == AppBackgroundState.foreground) {
      return;
    }

    final disabledChats = getIt<NotificationsDisabledChatsCubit>();

    if (disabledChats.contains(message.chatId)) {
      return;
    }

    final localNotificationsProvider = getIt<LocalNotificationsProvider>();
    localNotificationsProvider.showNotification(
      message.owner.name,
      message.body,
      payload: message.chatId.toString(),
      id: message.chatId.hashCode,
      onSelect: (_) {
        BuildContext? context = App.getContext;
        if (context != null) {
          final onlineCubit = getIt<OnlineCubit>();
          final cachedUsersCubit = getIt<CachedUsersCubit>();
          final chatsCubit = getIt<CachedChatsCubit>();
          final selectedChat = chatsCubit.selectedChats.isNotEmpty
              ? chatsCubit.selectedChats.last
              : null;

          if (selectedChat != null && selectedChat.id == message.chatId) {
            return;
          }

          ChatScreenOpener(
            context,
            message.chatId,
            chatsCubit,
            onlineCubit: onlineCubit,
            cachedUsersCubit: cachedUsersCubit,
          ).call();
        }
      },
    );
  }
}
