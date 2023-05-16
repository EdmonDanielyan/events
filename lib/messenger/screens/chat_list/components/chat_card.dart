import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/messenger/constants/enums.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/message.dart';

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
  final ChatBadge chatBadge;
  const ChatCard({
    Key? key,
    required this.chat,
    required this.onlineCubit,
    required this.cachedChatsCubit,
    this.highlightValue = "",
    required this.notReadMsgs,
    this.chatName,
    this.chatAvatar,
    this.chatBadge = ChatBadge.none,
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
                String iconLink = "";
                Color backgroundColor = Palette.white;
                switch (chatBadge) {
                  case ChatBadge.vacation:
                    iconLink = IconLinks.SUN_ICON;
                    backgroundColor = Palette.yellow300;
                    break;
                  case ChatBadge.businessTrip:
                    iconLink = IconLinks.PLANE_ICON;
                    backgroundColor = Palette.purple255;
                    break;
                  default:
                    break;
                }
                return Badge(
                  isLabelVisible: chatBadge != ChatBadge.none,
                  label: SvgPicture.asset(
                    iconLink,
                    color: Palette.white,
                    height: 12.0,
                    width: 12.0,
                  ),
                  backgroundColor: backgroundColor,
                  smallSize: 20.0,
                  largeSize: 20.0,
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: CachedCircleAvatar(
                      url: chatAvatar ?? chat.avatarUrl,
                      name: chatName ?? chat.name,
                      indicator: user != null,
                      avatarHeight: 52.0,
                      avatarWidth: 52.0,
                    ),
                  ),
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
                Row(
                  children: [
                    Expanded(
                      child: ChatName(
                        chatName ?? chat.name,
                        highlightValue: highlightValue,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    if (chat.messages.isNotEmpty) ...[
                      ChatDate(chat.messages.last.createdAt),
                    ],
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ChatBody(
                        chat.messages.isNotEmpty ? chat.messages.last.body : "",
                        title: chat.isGroup && chat.messages.isNotEmpty
                            ? isByMe(chat.messages.last)
                                ? "Я:"
                                : "${chat.messages.last.owner.name}:"
                            : "",
                        highlightValue: highlightValue,
                      ),
                    ),
                    const SizedBox(width: 3.0),
                    if (notReadMsgs > 0) NotReadBubbble(notReadMsgs),
                    if (notReadMsgs < 1 && chat.messages.isNotEmpty)
                      MessageTick(
                        chat.messages.last.status,
                        isRead: chat.messages.last.isReadByOthers,
                        type: chat.messages.last.type,
                        readColor: Palette.blue9CF,
                      ),
                  ],
                ),
                const SizedBox(height: 12.0),
                const ChatDivider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
