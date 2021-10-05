import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ink_mobile/functions/date_sort.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/models/message.dart';
import 'package:ink_mobile/screens/messages/chat/components/date_widget.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> with MessageMixins {
  ScrollController controller = ScrollController();
  List<Message> messages = MessageListView.getExampleList();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ScrollBottom(controller).jump();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        if (isKeyboardVisible) bottomGapScroll(controller);
        DateTimeSort dateSort = DateTimeSort();

        return Container(
          child: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            child: ListView.builder(
              controller: controller,
              itemCount: messages.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    DateWidget(
                      dateTime: getMessageDateTime(
                        messages[index].messageDate,
                        dateSort,
                      ),
                    ),
                    MessageCard(message: messages[index]),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
