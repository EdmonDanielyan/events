import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_avatar.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_date.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_divider.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message_trailing.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_name.dart';
import 'package:ink_mobile/screens/messages/cubit/chat_list_cubit.dart';

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
    final _cubit = BlocProvider.of<ChatListCubit>(context);
    Message lastMessage = chat.messages.last;
    return Material(
      child: InkWell(
        onTap: () {
          _cubit.selectChat(index);
          Navigator.of(context).pushNamed("/message");
        },
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
                    indicator: lastMessage.user.online ? true : false,
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
                            ChatDate(chatDate: lastMessage.messageDate)
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: ChatMessage(
                                displayName: chat.group != null
                                    ? lastMessage.user.name
                                    : null,
                                message: lastMessage.message,
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
