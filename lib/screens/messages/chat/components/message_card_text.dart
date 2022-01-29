// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/components/linkify_text.dart';
import 'package:ink_mobile/constants/codes.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/message_table.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/date_functions.dart';
import 'package:ink_mobile/functions/files.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/tables/db_enum.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/providers/messenger.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card_picture.dart';
import 'package:ink_mobile/screens/messages/chat/components/respond_container_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat/components/sent_on_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_tick.dart';
import 'package:ink_mobile/setup.dart';

import 'edited.dart';

class MessageCardText extends StatelessWidget {
  final UserTable user;
  final MessageTable? message;
  final String? messageStr;
  final ChatDatabaseCubit chatDatabaseCubit;

  late bool byMe;

  Widget? userAvatar;

  MessageCardText({
    Key? key,
    required this.user,
    required this.message,
    this.messageStr,
    required this.chatDatabaseCubit,
  }) : super(key: key) {
    assert(message != null || messageStr != null);
    byMe = message != null ? message!.isByMe() : false;
  }

  ChatTable get getChat => chatDatabaseCubit.selectedChat!;

  Color textColor() {
    if (message?.type == StoredMessageType.DOCUMENT) {
      return Colors.black;
    }
    return byMe ? Colors.white : Colors.black;
  }

  Color bgColor() {
    if (message?.type == StoredMessageType.DOCUMENT) {
      return Colors.transparent;
    }
    return byMe ? const Color(0XFF46966E) : Colors.grey.shade200;
  }

  void _resend(BuildContext context) async {
    if (sl<Messenger>().isConnected) {
      await sl<Messenger>()
          .messageEditorSender
          .sendDeleteMessages([message!], context, makeRequest: false);

      final renewedMessage = MessageListView.renewMessage(message!);

      await sl<SendMessage>().addMessage(getChat, renewedMessage);
      await sl<Messenger>().textSender.sendMessage(getChat, renewedMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          byMe ? CrossAxisAlignment.center : CrossAxisAlignment.end,
      children: [
        _errorIconReload(context),
        if (!byMe) ...[
          _makeUserAvatarWidget(context),
          const SizedBox(width: 10.0),
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

  Widget _errorIconReload(BuildContext context) {
    if (message != null && message!.sentStatus == MessageSentStatus.ERROR) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () => _resend(context),
              child: Icon(Icons.replay, color: Colors.blue, size: 22),
            ),
          ),
          const SizedBox(width: 5.0),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Icon(Icons.error, color: Colors.red, size: 22),
          ),
        ],
      );
    }

    return SizedBox();
  }

  Widget _sentOn() {
    if (message != null && message!.actionsStatus == MessageActions.FORWARDED) {
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
          if (message?.actionsStatus == MessageActions.EDITED) ...[
            const SizedBox(width: 7.0),
            MessageEditedCard(
              brightness: byMe ? Brightness.dark : Brightness.light,
            ),
          ],
          const SizedBox(width: 5.0),
          _dateWidget(),
          if (byMe) ...[
            const SizedBox(width: 4.0),
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
        style: TextStyle(
          color: textColor(),
          fontSize: 16.0,
        ),
        linkStyle: TextStyle(color: textColor()),
      ),
    );
  }

  Widget _makeUserAvatarWidget(BuildContext context) {
    return userAvatar ??
        (userAvatar = SizedBox(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/personal",
                arguments: {'id': user.id, HIDE_BOTTOM_NAV_BAR_CODE: true}),
            child: CustomCircleAvatar(
              url: user.avatar,
              name: user.name,
            ),
          ),
          width: 45,
          height: 45,
        ));
  }

  Widget _dateWidget() {
    return Text(
      DateFunctions(passedDate: message?.timestamp ?? DateTime.now()).hourMinute(),
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
        message: message,
        brightness: message?.type == StoredMessageType.DOCUMENT
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
