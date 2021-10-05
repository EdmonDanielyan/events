import 'package:flutter/material.dart';

import 'package:ink_mobile/models/chat.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_count.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_tick.dart';

class ChatMessageTrailing extends StatelessWidget {
  final Chat chat;
  const ChatMessageTrailing({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: chat.unreadMessages > 0
          ? ChatCount(count: chat.unreadMessages)
          : ChatTick(chatStatus: chat.message.status),
    );
  }
}
