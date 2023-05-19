import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
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
    return SizedBox(
      height: 52.0,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              OnlineBuilder(
                    onlineCubit ?? OnlineCubit(),
                    userId: user.id,
                    builder: (context, onlineState, onlineUser) {
                      return CachedCircleAvatar(
                        url: onlineUser?.avatarUrl ?? user.avatarUrl,
                        name: onlineUser?.name ?? user.name,
                        avatarHeight: 44.0,
                        avatarWidth: 44.0,
                        indicator: onlineUser != null,
                        indicatorSize: 8.0,
                      );
                    },
                    cachedChatsCubit: cachedChatsCubit,
                  ),
              const SizedBox(width: 12.0),
              Column(
                children: [
                  Text(
                    user.name,
                    style: FontStyles.rubikP2Medium(
                      color: Palette.textBlack,
                    ),
                  ),
                  Text(
                    user.workPosition ?? "",
                    style: FontStyles.rubikP3(color: Palette.textBlack50),
                  ),
                ],
              ),
              const Spacer(),
              trailingWidget ?? const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
