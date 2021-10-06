import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_avatar.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_date.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_divider.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message_trailing.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_name.dart';

class ChatListTile extends StatelessWidget {
  final String highlightValue;
  final EdgeInsetsGeometry? contentPadding;
  final int index;
  final Chat chat;
  final double leadingGap;
  const ChatListTile(
      {Key? key,
      this.highlightValue = "",
      required this.index,
      required this.chat,
      this.contentPadding,
      this.leadingGap = 15.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed("/message", arguments: chat),
        child: Container(
          padding: contentPadding,
          margin: EdgeInsets.only(bottom: 7.0, top: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChatAvatar(
                    url: chat.avatarUrl,
                    indicator: chat.message.user.online ? true : false,
                  ),
                  SizedBox(width: leadingGap),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ChatName(
                                name: chat.chatName,
                                highlightValue: highlightValue,
                              ),
                            ),
                            SizedBox(width: 2.0),
                            ChatDate(chatDate: chat.message.messageDate)
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: ChatMessage(
                                displayName: chat.group != null
                                    ? chat.message.user.name
                                    : null,
                                message: chat.message.message,
                                highlightValue: highlightValue,
                              ),
                            ),
                            ChatMessageTrailing(chat: chat),
                          ],
                        ),
                        SizedBox(height: 10.0)
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 0.0,
                    child: Opacity(
                        child: ChatAvatar(url: chat.avatarUrl), opacity: 0.0),
                  ),
                  SizedBox(width: leadingGap),
                  Expanded(child: ChatDivider())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
