import 'package:flutter/material.dart';
import 'package:ink_mobile/models/message.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card_text.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({Key? key, required this.message}) : super(key: key);

  Widget _getMessageWidget() {
    return MessageCardText(message: message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 7),
      child: Align(
        alignment: message.byMe ? Alignment.topRight : Alignment.topLeft,
        child: _getMessageWidget(),
      ),
    );
  }
}
