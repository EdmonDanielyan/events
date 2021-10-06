import 'package:flutter/material.dart';
import 'package:ink_mobile/components/linkify_text.dart';
import 'package:ink_mobile/functions/date_functions.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_avatar.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_tick.dart';

class MessageCardText extends StatelessWidget {
  final Message message;
  const MessageCardText({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          message.byMe ? CrossAxisAlignment.center : CrossAxisAlignment.end,
      children: [
        if (message.status == MessageStatus.ERROR) ...[
          Icon(Icons.error, color: Colors.red, size: 22),
          SizedBox(width: 5.0),
        ],
        if (!message.byMe) ...[
          userAvatarWidget(),
          SizedBox(width: 10.0),
        ],
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: containerBorderRadius(),
              color: message.byMe ? Colors.green[200] : Colors.grey.shade200,
            ),
            padding: EdgeInsets.all(13),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(child: LinkifyText(text: message.message)),
                SizedBox(width: 5.0),
                dateWidget(),
                if (message.byMe) ...[
                  SizedBox(width: 4.0),
                  statusWidget(),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget userAvatarWidget() {
    return SizedBox(
      child: ChatAvatar(url: message.user.avatarUrl),
      width: 45,
      height: 45,
    );
  }

  Widget dateWidget() {
    return Text(
      DateFunctions(passedDate: message.messageDate).hourMinute(),
      style: TextStyle(fontSize: 11.0),
    );
  }

  Widget statusWidget() {
    return SizedBox(
      width: 14,
      height: 14,
      child: ChatTick(chatStatus: message.status),
    );
  }

  BorderRadiusGeometry containerBorderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(10.0),
      bottomLeft: Radius.circular(message.byMe ? 10.0 : 2.0),
      topRight: Radius.circular(10.0),
      bottomRight: Radius.circular(message.byMe ? 2.0 : 10.0),
    );
  }
}
