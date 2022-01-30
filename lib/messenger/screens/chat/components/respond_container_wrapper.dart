import 'package:flutter/material.dart';
import 'package:ink_mobile/extensions/message_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/screens/chat/components/respond_container.dart';

import 'message_list.dart';

class RespondContainerWrapper extends StatelessWidget {
  final Widget child;
  final MessageTable message;
  final Color? textColor;
  const RespondContainerWrapper({
    Key? key,
    required this.child,
    required this.message,
    this.textColor,
  }) : super(key: key);

  bool get byMe => message.isByMe();

  Color get myTxtColor => byMe ? Colors.white : Colors.black;

  Color get bgColorDarker => byMe ? Color(0XFF3e8b64) : Colors.grey.shade300;

  CrossAxisAlignment get crossAxisAlignment =>
      byMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

  MessageWithUser? selectedMessage() {
    if (message.repliedMessageId == null) return null;

    return MessageWithUserListView.getByMessageId(
        message.repliedMessageId!, MessageList.messagesWithUser!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (message.repliedMessageId != null && selectedMessage() != null) ...[
          RespondMessageContainer(
            selectedMessage: selectedMessage()!,
            bgColor: bgColorDarker,
            txtColor:
                textColor?.withOpacity(0.8) ?? myTxtColor.withOpacity(0.8),
          ),
          SizedBox(height: 5.0),
        ],
        child,
      ],
    );
  }
}
