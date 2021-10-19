import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_chat_screen.dart';

class NewChatBtn extends StatelessWidget {
  const NewChatBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => CustomBottomSheet(
        context: context,
        child: NewChatScreen(),
      ),
      icon: Icon(CupertinoIcons.chat_bubble_text, size: 30),
    );
  }
}
