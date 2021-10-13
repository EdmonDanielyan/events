import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_avatar.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_date.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_divider.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message_trailing.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_name.dart';
import 'package:ink_mobile/screens/messages/chat_list/functions/open_chat.dart';

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

  bool get hasMessage => chat.messages.isNotEmpty;

  Message? get lastMessage => hasMessage ? chat.messages.last : null;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => OpenChat(context, chat, index),
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
                    indicator:
                        hasMessage && lastMessage!.user.online ? true : false,
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
                            if (hasMessage) ...[
                              ChatDate(chatDate: lastMessage!.messageDate),
                            ],
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (hasMessage) ...[
                              Expanded(
                                child: ChatMessage(
                                  displayName: chat.group != null
                                      ? lastMessage!.user.name
                                      : null,
                                  message: lastMessage!.message,
                                  highlightValue: highlightValue,
                                ),
                              ),
                              ChatMessageTrailing(chat: chat),
                            ],
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
