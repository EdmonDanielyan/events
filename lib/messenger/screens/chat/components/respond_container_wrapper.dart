import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';

import 'respond_container.dart';

class MessageRespondWrapper extends StatefulWidget {
  final Widget child;
  final Message message;
  final CachedChatsCubit cachedChatsCubit;
  const MessageRespondWrapper({
    Key? key,
    required this.child,
    required this.message,
    required this.cachedChatsCubit,
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
      return Column(
        crossAxisAlignment:
            isByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          RespondContainer(
            isByMe: isByMe,
            message: respondedMessage!,
          ),
          const SizedBox(height: 2.0),
          widget.child,
          const SizedBox(height: 7.0),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: widget.child,
    );
  }
}
