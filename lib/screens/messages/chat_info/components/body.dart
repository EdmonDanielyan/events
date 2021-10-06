import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/bottom_btns.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/data_section.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/header.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/users.dart';

class Body extends StatelessWidget {
  final Chat chat;
  const Body({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 20.0;
    return SingleChildScrollView(
      child: Column(
        children: [
          ChatInfoHeader(
            horizontalPadding: horizontalPadding,
            chat: chat,
          ),
          divider(),
          SizedBox(height: 25.0),
          divider(),
          ChatInfoDataSection(horizontalPadding: horizontalPadding),
          divider(),
          SizedBox(height: 25.0),
          ChatInfoUsers(),
          divider(),
          SizedBox(height: 25.0),
          divider(),
          ChatInfoBottomBtns(
            horizontalPadding: horizontalPadding,
            chat: chat,
          ),
          divider(),
        ],
      ),
    );
  }

  Widget divider() {
    return Divider(color: Colors.grey, height: 2.0);
  }
}
