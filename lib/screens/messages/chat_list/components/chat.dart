import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_date.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_divider.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_message_trailing.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_name.dart';

class ChatListTile extends StatelessWidget {
  final String highlightValue;
  final EdgeInsetsGeometry? contentPadding;
  final int index;
  final ChatTable chat;
  final double leadingGap;
  final List<MessageTable> messages;
  final ChatDatabaseCubit chatDatabaseCubit;
  const ChatListTile(
      {Key? key,
      this.highlightValue = "",
      required this.index,
      required this.chat,
      required this.messages,
      required this.chatDatabaseCubit,
      this.contentPadding,
      this.leadingGap = 15.0})
      : super(key: key);

  bool get hasMessage => messages.isNotEmpty;

  MessageTable get lastMessage => messages.last;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        //onTap: () => OpenChat(context, chat, index),
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
                  CustomCircleAvatar(
                    url: chat.avatar,
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
                                name: chat.name,
                                highlightValue: highlightValue,
                              ),
                            ),
                            SizedBox(width: 2.0),
                            if (hasMessage) ...[
                              ChatDate(chatDate: lastMessage.created!),
                            ],
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (hasMessage) ...[
                              Expanded(
                                child: _displayBody(),
                              ),
                              ChatMessageTrailing(messages: messages),
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
                        child: CustomCircleAvatar(url: chat.avatar),
                        opacity: 0.0),
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

  Widget _displayBody() {
    return StreamBuilder(
      stream: chatDatabaseCubit.db.watchUser(lastMessage.userId),
      builder: (context, AsyncSnapshot<UserTable> snapshot) {
        UserTable? user = snapshot.data ?? null;

        print(snapshot.data);

        return ChatMessage(
          displayName:
              ChatListView.isGroup(chat) && user != null ? user.name : null,
          message: lastMessage.message,
          highlightValue: highlightValue,
        );
      },
    );
  }
}
