import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_count.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_tick.dart';

class ChatMessageTrailing extends StatelessWidget {
  final List<MessageWithUser> messagesWithUser;
  final bool showUnread;
  const ChatMessageTrailing({Key? key, required this.messagesWithUser, required this.showUnread})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int unreadMessages =
        MessageListView.unreadMessagesByMessageWithUser(messagesWithUser);
    return Container(
      child: unreadMessages > 0 && showUnread
          ? ChatCount(count: unreadMessages)
          : ChatTick(
              message: messagesWithUser.last.message,
              brightness: Brightness.light,
            ),
    );
  }
}
