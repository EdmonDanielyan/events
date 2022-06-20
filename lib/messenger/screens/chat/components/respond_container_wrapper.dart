import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/cached_user_builder.dart';

import 'respond_container.dart';

class MessageRespondWrapper extends StatefulWidget {
  final Widget child;
  final Message message;
  final CachedChatsCubit cachedChatsCubit;
  final CachedUsersCubit cachedUsersCubit;
  const MessageRespondWrapper({
    Key? key,
    required this.child,
    required this.message,
    required this.cachedChatsCubit,
    required this.cachedUsersCubit,
  }) : super(key: key);

  @override
  State<MessageRespondWrapper> createState() => _MessageRespondWrapperState();
}

class _MessageRespondWrapperState extends State<MessageRespondWrapper> {
  Message? get respondedMessage => widget.message.responseTo;

  bool get isByMe => widget.message.isByMe(widget.cachedChatsCubit.myId);

  @override
  Widget build(BuildContext context) {
    if (respondedMessage != null) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedUserBuilder(
              cachedUsersCubit: widget.cachedUsersCubit,
              userId: respondedMessage!.owner.id,
              builder: (context, userState, user) {
                return RespondContainer(
                  isByMe: isByMe,
                  body: respondedMessage!.body,
                  name: user?.name ?? "Пересланное сообщение",
                );
              },
            ),
            const SizedBox(height: 2.0),
            widget.child,
            const SizedBox(height: 7.0),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: widget.child,
    );
  }
}
