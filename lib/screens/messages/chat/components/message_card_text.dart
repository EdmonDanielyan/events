import 'package:flutter/material.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/components/linkify_text.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/date_functions.dart';
import 'package:ink_mobile/functions/files.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card_picture.dart';
import 'package:ink_mobile/screens/messages/chat/components/respond_container_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat/components/sent_on_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_tick.dart';

class MessageCardText extends StatelessWidget {
  final UserTable user;
  final MessageTable? message;
  final String? messageStr;

  const MessageCardText({
    Key? key,
    required this.user,
    required this.message,
    this.messageStr,
  })  : assert(message != null || messageStr != null),
        super(key: key);

  bool get byMe => message != null ? MessageListView.isByMe(message!) : false;

  Color textColor() {
    if (message?.type == MessageType.Document) {
      return Colors.black;
    }
    return byMe ? Colors.white : Colors.black;
  }

  Color bgColor() {
    if (message?.type == MessageType.Document) {
      return Colors.transparent;
    }
    return byMe ? Color(0XFF46966E) : Colors.grey.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          byMe ? CrossAxisAlignment.center : CrossAxisAlignment.end,
      children: [
        _errorIcon(),
        if (!byMe) ...[
          _userAvatarWidget(),
          SizedBox(width: 10.0),
        ],
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: containerBorderRadius(),
              color: bgColor(),
            ),
            padding: EdgeInsets.all(9.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  byMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                _sentOn(),
                _respondContainer(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _errorIcon() {
    if (message != null && message!.status == MessageStatus.ERROR) {
      return Container(
        margin: EdgeInsets.only(right: 5),
        child: Icon(Icons.error, color: Colors.red, size: 22),
      );
    }

    return SizedBox();
  }

  Widget _sentOn() {
    if (message != null && message!.sentOn) {
      return Container(
        margin: EdgeInsets.only(bottom: 5),
        child: SentOnWidget(),
      );
    }

    return SizedBox();
  }

  Widget _respondContainer() {
    if (message == null) {
      return _showMessage();
    }

    return RespondContainerWrapper(
      message: message!,
      textColor: textColor(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _showMessage(),
          SizedBox(width: 5.0),
          _dateWidget(),
          if (byMe) ...[
            SizedBox(width: 4.0),
            _statusWidget(),
          ],
        ],
      ),
    );
  }

  Widget _showMessage() {
    final String msg = message?.message ?? "";
    if (isStrPicture(msg)) {
      return MessageCardPicture(url: msg);
    }

    return Flexible(
      child: LinkifyText(
        text: messageStr != null ? messageStr! : msg,
        style: TextStyle(color: textColor()),
        linkStyle: TextStyle(color: textColor()),
      ),
    );
  }

  Widget _userAvatarWidget() {
    return SizedBox(
      child: CustomCircleAvatar(
        url: user.avatar,
        name: user.name,
      ),
      width: 45,
      height: 45,
    );
  }

  Widget _dateWidget() {
    return Text(
      DateFunctions(passedDate: message!.created!).hourMinute(),
      style: TextStyle(
        fontSize: 11.0,
        color: textColor(),
      ),
    );
  }

  Widget _statusWidget() {
    return SizedBox(
      width: 14,
      height: 14,
      child: ChatTick(
        chatStatus: message!.status,
        brightness: message?.type == MessageType.Document
            ? Brightness.light
            : Brightness.dark,
      ),
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
