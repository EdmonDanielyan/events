import 'package:flutter/material.dart';
import 'package:ink_mobile/components/avatar_with_badge.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/models/absence.dart';

import 'chat_body.dart';
import 'chat_date.dart';
import 'chat_divider.dart';
import 'chat_name.dart';
import 'message_tick.dart';
import 'not_read_bubble.dart';
import 'online_builder.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  final OnlineCubit onlineCubit;
  final CachedChatsCubit cachedChatsCubit;
  final String highlightValue;
  final int notReadMsgs;
  final String? chatName;
  final String? chatAvatar;
  final Absence? absence;
  const ChatCard({
    Key? key,
    required this.chat,
    required this.onlineCubit,
    required this.cachedChatsCubit,
    this.highlightValue = "",
    required this.notReadMsgs,
    this.chatName,
    this.chatAvatar,
    this.absence,
  }) : super(key: key);

  bool isByMe(Message message) => message.isByMe(cachedChatsCubit.myId);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (chat.isSingle) ...[
            OnlineBuilder(
              onlineCubit,
              userId: chat.getFirstNotMyId(cachedChatsCubit.myId),
              builder: (context, onlineState, user) {
                return AvatarWithBadge(
                  avatarHeight: 52.0,
                  avatarWidth: 52.0,
                  url: chatAvatar ?? chat.avatarUrl,
                  name: chatName ?? chat.name,
                  indicator: user != null,
                  padding: const EdgeInsets.only(left: 4.0),
                  absence: absence,
                );
              },
              cachedChatsCubit: cachedChatsCubit,
            ),
          ],
          if (!chat.isSingle)
            CachedCircleAvatar(
              url: chatAvatar ?? chat.avatarUrl,
              name: chatName ?? chat.name,
              avatarHeight: 52.0,
              avatarWidth: 52.0,
            ),
          const SizedBox(width: 15.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChatName(
                  chatName ?? chat.name,
                  highlightValue: highlightValue,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                ChatBody(
                  chat.messages.isNotEmpty ? chat.messages.last.body : "",
                  title: chat.isGroup && chat.messages.isNotEmpty
                      ? isByMe(chat.messages.last)
                          ? "Вы:"
                          : "${chat.messages.last.owner.name}:"
                      : "",
                  highlightValue: highlightValue,
                ),
                const SizedBox(height: 12.0),
                const ChatDivider(),
              ],
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Column(
            children: [
              if (chat.messages.isNotEmpty) ...[
                ChatDate(chat.messages.last.createdAt),
              ],
              const SizedBox(
                height: 8.0,
              ),
              if (notReadMsgs > 0) NotReadBubbble(notReadMsgs),
              if (notReadMsgs < 1 && chat.messages.isNotEmpty)
                MessageTick(
                  chat.messages.last.status,
                  isRead: chat.messages.last.isReadByOthers,
                  type: chat.messages.last.type,
                  color: Palette.blue9CF,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
