import 'package:flutter/material.dart';
import 'package:ink_mobile/components/avatar_with_badge.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/online_builder.dart';

class ParticipantCard extends StatelessWidget {
  final User user;
  final Widget? trailingWidget;
  final Widget? divider;
  final OnlineCubit? onlineCubit;
  final CachedChatsCubit cachedChatsCubit;
  const ParticipantCard({
    Key? key,
    required this.user,
    this.divider,
    this.trailingWidget,
    this.onlineCubit,
    required this.cachedChatsCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            OnlineBuilder(
              onlineCubit ?? OnlineCubit(),
              userId: user.id,
              builder: (context, onlineState, onlineUser) {
                return AvatarWithBadge(
                  url: onlineUser?.avatarUrl ?? user.avatarUrl,
                  name: onlineUser?.name ?? user.name,
                  avatarHeight: 44.0,
                  avatarWidth: 44.0,
                  absence: onlineUser?.absence,
                  birthday: onlineUser?.birthday,
                );
              },
              cachedChatsCubit: cachedChatsCubit,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: FontStyles.rubikP2Medium(
                      color: Palette.textBlack,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    user.workPosition ?? "",
                    style: FontStyles.rubikP3(color: Palette.textBlack50),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            trailingWidget ?? const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
