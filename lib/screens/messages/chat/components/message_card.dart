import 'package:flutter/material.dart';
import 'package:ink_mobile/components/selectable_widget.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat/chat_screen.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card_text.dart';
import 'package:ink_mobile/screens/messages/chat/components/hover_message.dart';

import 'message_search_wrapper.dart';

class MessageCard extends StatelessWidget {
  final int index;
  final MessageWithUser messageWithUser;
  final UserTable user;
  const MessageCard(
      {Key? key,
      required this.messageWithUser,
      required this.user,
      required this.index})
      : super(key: key);
  static late ChatCubit _chatCubit;
  static late List<Message> selectedMessages;

  MessageTable get message => messageWithUser.message!;

  void _onSwitchSelected(bool enabled) {
    _chatCubit.selectMessage(index, enabled);
  }

  @override
  Widget build(BuildContext context) {
    _chatCubit = ChatScreen.of(context).chatCubit;
    selectedMessages = _chatCubit.getSelectedMessages;
    bool showSelection = selectedMessages.length > 0;

    return SelectableWidget(
      isOn: showSelection,
      selected: false, // message.selected,
      onSwitch: _onSwitchSelected,
      child: HoverMessage(
        index: index,
        message: message,
        child: MessageSearchWrapper(
          chatCubit: _chatCubit,
          message: message,
          child: Container(
            padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 7),
            child: Align(
              alignment: MessageListView.isByMe(message)
                  ? Alignment.topRight
                  : Alignment.topLeft,
              child: _getMessageWidget(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMessageWidget() {
    return MessageCardText(messageWithUser: messageWithUser);
  }
}
