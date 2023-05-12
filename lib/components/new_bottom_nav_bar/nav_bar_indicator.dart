import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/builder.dart';

class NavBarIndicator extends StatelessWidget {
  final CachedChatsCubit cachedChatsCubit;
  const NavBarIndicator({Key? key, required this.cachedChatsCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatsBuilder(
      cachedChatsCubit: cachedChatsCubit,
      builder: (context, state) {
        int notReadMessages = cachedChatsCubit.notReadMsgsOfAllChats();
        if (notReadMessages == 0) return const SizedBox.shrink();
        return Positioned(
          top: 1.0,
          right: 0.0,
          child: Icon(
            Icons.brightness_1,
            size: 10.0,
            color: Colors.red[400],
          ),
        );
      },
    );
  }
}
