import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/functions/date_sort.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat/components/date_widget.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card.dart';

class MessageList extends StatelessWidget with MessageMixins {
  const MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: BlocBuilder<ChatCubit, ChatCubitState>(
          builder: (BuildContext context, state) {
            DateTimeSort dateSort = DateTimeSort();
            List<Message> messages = state.chat.messages;
            return ListView.builder(
              controller: ScrollController(keepScrollOffset: false),
              itemCount: messages.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    DateWidget(
                      dateTime: getMessageDateTime(
                          messages[index].messageDate, dateSort),
                    ),
                    MessageCard(message: messages[index]),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
