import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/network.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_state.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/chat_info/components/participant_card.dart';

import '../../../functions/size_config.dart';

class NotificationsBtn extends StatelessWidget {
  final void Function(BuildContext)? onPressed;
  final CachedChatsCubit cachedChatsCubit;
  final NotificationsDisabledChatsCubit notificationsDisabledChatsCubit;
  final int chatId;
  const NotificationsBtn({
    Key? key,
    this.onPressed,
    required this.cachedChatsCubit,
    required this.notificationsDisabledChatsCubit,
    required this.chatId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsDisabledChatsCubit,
            NotificationsDisabledChatsState>(
        bloc: notificationsDisabledChatsCubit,
        builder: (context, state) {
          bool contains = state.chatIds.contains(chatId);

          return GestureDetector(
            onTap: () {
              if (contains) {
                notificationsDisabledChatsCubit.remove(chatId);
                DisabledNotificationsChatNetworkRequest(chatID: chatId.toString(),value: true)().then((value) => print(value)).onError((error, stackTrace) => print(error));
              } else {
                notificationsDisabledChatsCubit.add(chatId);
                DisabledNotificationsChatNetworkRequest(chatID: chatId.toString(),value: false)().then((value) => print(value)).onError((error, stackTrace) => print(error));
              }
            },
            child: ParticipantCard(
              user: const User(),
              avatarWidget: Container(
                decoration: const BoxDecoration(
                  color: Color(0XFFD75F50),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: Icon(
                  contains ? Icons.volume_up_rounded : Icons.volume_off_rounded,
                  color: Colors.white,
                  size: SizeConfig(context, 22).getProportionateScreenHeight,
                ),
              ),
              divider: const SizedBox(),
              title: GoogleText(
                contains ? "Включить уведомления" : "Выключить уведомления",
                fontWeight: FontWeight.bold,
              ),
              cachedChatsCubit: cachedChatsCubit,
            ),
          );
        });
  }
}
