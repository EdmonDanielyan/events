import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat/components/bottom_bar.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_list.dart';

class Body extends StatelessWidget {
  final Chat chat;
  const Body({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: MessageList(
          messages: chat.messages,
        )),
        MessageBottomBar(),
      ],
    );
  }
}
