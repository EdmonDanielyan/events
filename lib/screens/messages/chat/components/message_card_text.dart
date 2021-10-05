import 'package:flutter/material.dart';
import 'package:ink_mobile/functions/date_functions.dart';
import 'package:ink_mobile/models/message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_tick.dart';

class MessageCardText extends StatelessWidget {
  final Message message;
  const MessageCardText({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (message.status == MessageStatus.ERROR) ...[
          Icon(Icons.error, color: Colors.red, size: 22),
        ],
        SizedBox(width: 5.0),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: message.byMe ? Colors.green[200] : Colors.grey.shade200,
            ),
            padding: EdgeInsets.all(13),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(message.message),
                ),
                SizedBox(width: 5.0),
                Text(
                  DateFunctions(passedDate: message.messageDate).hourMinute(),
                  style: TextStyle(fontSize: 11.0),
                ),
                if (message.byMe) ...[
                  SizedBox(width: 4.0),
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: ChatTick(chatStatus: message.status),
                  )
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
