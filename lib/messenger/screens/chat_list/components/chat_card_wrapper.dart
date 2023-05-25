import 'package:flutter/material.dart';
import 'package:ink_mobile/components/alert/alert_cancel.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/components/dismissible/custom_dismissible.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/cached_user_builder.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_card.dart';

class ChatCardWrapper extends StatelessWidget {
  final CachedChatsCubit cachedChatsCubit;
  final Chat chat;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final void Function(DismissDirection)? onDismissed;
  final void Function()? onTap;
  final String highlightValue;
  final int unreadMsgsCount;
  final OnlineCubit onlineCubit;
  final CachedUsersCubit cachedUsersCubit;
  const ChatCardWrapper({
    Key? key,
    required this.cachedChatsCubit,
    required this.chat,
    this.confirmDismiss,
    this.onDismissed,
    this.onTap,
    this.highlightValue = "",
    required this.unreadMsgsCount,
    required this.onlineCubit,
    required this.cachedUsersCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomDismissible(
        uniqueKey: UniqueKey(),
        confirmDismiss: (direction) async {
          CustomAlertCancel(
            context,
            title: localizationInstance.delete,
            body: localizationInstance.deleteChatHint,
            onSubmit: () async {
              onDismissed?.call(direction);
              Navigator.of(context).pop();
            },
          ).call();

          return false;
        },
        onDismissed: onDismissed,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            children: [
              if (chat.isSingle)
                CachedUserBuilder(
                  cachedUsersCubit: cachedUsersCubit,
                  userId: chat.getFirstNotMyId(cachedChatsCubit.myId),
                  builder: (context, state, user) {
                    return ChatCard(
                      chat: chat,
                      onlineCubit: onlineCubit,
                      cachedChatsCubit: cachedChatsCubit,
                      notReadMsgs: unreadMsgsCount,
                      chatName: user?.name,
                      chatAvatar: user?.avatarUrl,
                      absence: user?.absence,
                    );
                  },
                ),
              if (!chat.isSingle)
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: ChatCard(
                    chat: chat,
                    onlineCubit: onlineCubit,
                    cachedChatsCubit: cachedChatsCubit,
                    notReadMsgs: unreadMsgsCount,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
