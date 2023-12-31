import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_state.dart';

class NotificationsBtn extends StatelessWidget {
  final void Function(BuildContext)? onPressed;
  final CachedChatsCubit cachedChatsCubit;
  final ToggleNotificationsChatsCubit toggleNotificationsChatsCubit;
  final int chatId;
  const NotificationsBtn({
    Key? key,
    this.onPressed,
    required this.cachedChatsCubit,
    required this.toggleNotificationsChatsCubit,
    required this.chatId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleNotificationsChatsCubit,
        NotificationsDisabledChatsState>(
      bloc: toggleNotificationsChatsCubit,
      builder: (context, state) {
        bool isEnabled =
            toggleNotificationsChatsCubit.isChatNotificationsEnabled(chatId);

        return InkWell(
          onTap: () => toggleNotificationsChatsCubit.toggleNotification(
            chatId,
            isEnabled,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                SvgPicture.asset(
                    isEnabled ? IconLinks.MUTE_ICON : IconLinks.SOUND_ICON,
                    height: 24.0,
                    width: 24.0,
                    colorFilter:
                        ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
                const SizedBox(width: 12.0),
                Text(
                  isEnabled ? "Выкл. уведомления" : "Вкл. уведомления",
                  style: FontStyles.rubikP1(color: Palette.textBlack),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
