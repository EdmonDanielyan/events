import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/online_builder.dart';

import 'divider.dart';

class ParticipantCard extends StatelessWidget {
  final User user;
  final String trailing;
  final Widget? trailingWidget;
  final Widget? divider;
  final Widget? avatarWidget;
  final Widget? title;
  final EdgeInsetsGeometry? padding;
  final OnlineCubit? onlineCubit;
  final CachedChatsCubit cachedChatsCubit;
  const ParticipantCard({
    Key? key,
    required this.user,
    this.trailing = "",
    this.divider,
    this.trailingWidget,
    this.avatarWidget,
    this.title,
    this.padding,
    this.onlineCubit,
    required this.cachedChatsCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.only(
            top: 4.0,
            bottom: 4.0,
          ),
      child: Row(
        children: [
          SizedBox(
            width: 35.0,
            height: 35,
            child: avatarWidget ??
                OnlineBuilder(
                  onlineCubit ?? OnlineCubit(),
                  userId: user.id,
                  builder: (context, onlineState, onlineUser) {
                    return CachedCircleAvatar(
                      url: onlineUser?.avatarUrl ?? user.avatarUrl,
                      name: onlineUser?.name ?? user.name,
                      avatarHeight: 40,
                      avatarWidth: 40,
                      indicator: onlineUser != null,
                      indicatorSize: 10.0,
                    );
                  },
                  cachedChatsCubit: cachedChatsCubit,
                ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: title ??
                          GoogleText(
                            user.name,
                            color: const Color(0XFF1D2126),
                            fontSize: 16.0,
                          ),
                    ),
                    trailingWidget ?? const SizedBox(),
                    if (trailing.isNotEmpty) ...[
                      const SizedBox(width: 10.0),
                      GoogleText(
                        trailing,
                        color: const Color(0XFF757678),
                        fontSize: 14.0,
                      )
                    ],
                  ],
                ),
                divider ?? const SizedBox(height: 10.0),
                divider ?? const ChatInfoDivider(),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
