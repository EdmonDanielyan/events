import 'package:flutter/material.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/components/linkify_text.dart';
import 'package:ink_mobile/functions/date_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/screens/messages/chat/components/respond_container_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat/components/sent_on_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_tick.dart';

class MessageCardText extends StatelessWidget {
  final MessageWithUser messageWithUser;
  const MessageCardText({Key? key, required this.messageWithUser})
      : super(key: key);

  MessageTable get message => messageWithUser.message!;
  UserTable? get user => messageWithUser.user;

  bool get byMe => MessageListView.isByMe(message);

  Color get textColor => byMe ? Colors.white : Colors.black;

  Color get bgColor => byMe ? Color(0XFF46966E) : Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          byMe ? CrossAxisAlignment.center : CrossAxisAlignment.end,
      children: [
        if (message.status == MessageStatus.ERROR) ...[
          Icon(Icons.error, color: Colors.red, size: 22),
          SizedBox(width: 5.0),
        ],
        if (!byMe) ...[
          userAvatarWidget(),
          SizedBox(width: 10.0),
        ],
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: containerBorderRadius(),
              color: bgColor,
            ),
            padding: EdgeInsets.all(9.5),
            child: Column(
              crossAxisAlignment:
                  byMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (message.sentOn) ...[
                  SentOnWidget(),
                  SizedBox(height: 5.0),
                ],
                RespondContainerWrapper(
                  message: message,
                  textColor: textColor,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: LinkifyText(
                          text: message.message,
                          style: TextStyle(color: textColor),
                          linkStyle: TextStyle(color: textColor),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      dateWidget(),
                      if (byMe) ...[
                        SizedBox(width: 4.0),
                        statusWidget(),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget userAvatarWidget() {
    return SizedBox(
      child: CustomCircleAvatar(url: user!.avatar),
      width: 45,
      height: 45,
    );
  }

  Widget dateWidget() {
    return Text(
      DateFunctions(passedDate: message.created!).hourMinute(),
      style: TextStyle(
        fontSize: 11.0,
        color: textColor,
      ),
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
      bottomLeft: Radius.circular(byMe ? 10.0 : 2.0),
      topRight: Radius.circular(10.0),
      bottomRight: Radius.circular(byMe ? 2.0 : 10.0),
    );
  }
}
