import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat/components/app_bar_title.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_btn.dart';

import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  final Chat chat;
  const ChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(
        titleWidget: ChatAppBarTitle(chat: chat),
        title: "",
        actions: [MessageSearchBtn()],
      ),
      body: Body(),
    );
  }
}
