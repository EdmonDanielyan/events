import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_state.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/chat_info/components/participant_card.dart';

import '../../../functions/size_config.dart';

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
        bool isEnabled = toggleNotificationsChatsCubit.isChatNotificationsEnabled(chatId);

        return GestureDetector(
          onTap: () {
            toggleNotificationsChatsCubit.toggleNotification(chatId, isEnabled);
          },
          child: ParticipantCard(
            user: const User(),
            avatarWidget: Container(
              decoration: BoxDecoration(
                color: Palette.redF50,
                borderRadius: const BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Icon(
                isEnabled ? Icons.volume_up_rounded : Icons.volume_off_rounded,
                color: Palette.white,
                size: SizeConfig(context, 22).getProportionateScreenHeight,
              ),
            ),
            divider: const SizedBox.shrink(),
            title: GoogleText(
              isEnabled ? "Включить уведомления" : "Выключить уведомления",
              fontWeight: FontWeight.bold,
            ),
            cachedChatsCubit: cachedChatsCubit,
          ),
        );
      },
    );
  }
}
