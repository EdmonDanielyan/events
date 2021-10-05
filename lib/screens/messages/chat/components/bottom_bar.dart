import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/messages/chat/components/send_btn.dart';
import 'package:ink_mobile/screens/messages/chat/components/textfield.dart';

class MessageBottomBar extends StatelessWidget {
  const MessageBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 7.0, top: 7.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!.withOpacity(0.8),
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(child: MessageTextfield()),
            SizedBox(width: 8.0),
            MessageSendBtn(),
          ],
        ),
      ),
    );
  }
}
