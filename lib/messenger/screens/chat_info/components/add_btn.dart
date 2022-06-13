import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/chat_info/components/participant_card.dart';

class ChatInfoAddBtn extends StatelessWidget {
  final void Function(BuildContext)? onPressed;
  final CachedChatsCubit cachedChatsCubit;
  const ChatInfoAddBtn({
    Key? key,
    this.onPressed,
    required this.cachedChatsCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!(context);
        }
      },
      child: ParticipantCard(
        user: const User(),
        avatarWidget: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 26.0,
          ),
        ),
        title: const GoogleText(
          "Добавить пользователя",
          fontWeight: FontWeight.bold,
        ),
        cachedChatsCubit: cachedChatsCubit,
      ),
    );
  }
}
