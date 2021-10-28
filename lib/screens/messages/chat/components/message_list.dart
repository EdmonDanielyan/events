import 'package:flutter/material.dart';
import 'package:ink_mobile/functions/date_sort.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/screens/messages/chat/components/date_widget.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card.dart';

import '../chat_screen.dart';

class MessageList extends StatelessWidget with MessageMixins {
  const MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatDatabaseCubit = ChatScreen.of(context).chatDatabaseCubit;
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Text("${chatDatabaseCubit.selectedChat!.id!}"),
        // child: StreamBuilder(
        //   stream: chatDatabaseCubit.db
        //       .watchChatMessages(chatDatabaseCubit.selectedChat!.id!),
        //   builder: (context, AsyncSnapshot<List<MessageWithUser>> snapshot) {
        //     if (snapshot.hasData) {
        //       List<MessageWithUser> messages = snapshot.data ?? [];
        //       DateTimeSort dateSort = DateTimeSort();

        //       if (messages.length > 0) {
        //         return ListView.builder(
        //           controller: ScrollController(keepScrollOffset: false),
        //           itemCount: messages.length,
        //           shrinkWrap: true,
        //           itemBuilder: (BuildContext context, int index) {
        //             return eachItem(messages[index], dateSort, index);
        //           },
        //         );
        //       }
        //     }
        //     return SizedBox();
        //   },
        // ),
      ),
    );
  }

  Widget eachItem(
      MessageWithUser messageWithUser, DateTimeSort dateSort, int index) {
    return Column(
      children: [
        DateWidget(
          dateTime:
              dateSort.getMessageDateTime(messageWithUser.message!.created!),
        ),
        MessageCard(
            messageWithUser: messageWithUser,
            user: UserTable(avatar: "", name: "", id: 0),
            index: index),
      ],
    );
  }
}
