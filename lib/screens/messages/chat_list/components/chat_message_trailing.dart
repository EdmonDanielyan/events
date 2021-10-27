import 'package:flutter/material.dart';

import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_count.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_tick.dart';

class ChatMessageTrailing extends StatelessWidget {
  final List<MessageTable> messages;
  const ChatMessageTrailing({Key? key, required this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int unreadMessages = MessageListView.unreadMessages(messages);
    return Container(
      child: unreadMessages > 0
          ? ChatCount(count: unreadMessages)
          : ChatTick(
              chatStatus: messages.last.status,
              brightness: Brightness.light,
            ),
    );
  }
}
