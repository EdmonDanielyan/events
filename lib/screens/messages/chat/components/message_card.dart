import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/selectable_widget.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card_text.dart';
import 'package:ink_mobile/screens/messages/chat/components/hover_message.dart';

import 'message_search_wrapper.dart';

class MessageCard extends StatelessWidget {
  final int index;
  final Message message;
  const MessageCard({Key? key, required this.message, required this.index})
      : super(key: key);
  static late ChatCubit _chatCubit;
  static late List<Message> selectedMessages;

  void _onSwitchSelected(bool enabled) {
    _chatCubit.selectMessage(index, enabled);
  }

  @override
  Widget build(BuildContext context) {
    _chatCubit = BlocProvider.of<ChatCubit>(context, listen: true);
    selectedMessages = _chatCubit.getSelectedMessages;
    bool showSelection = selectedMessages.length > 0;

    return SelectableWidget(
      isOn: showSelection,
      selected: message.selected,
      onSwitch: _onSwitchSelected,
      child: HoverMessage(
        index: index,
        message: message,
        child: MessageSearchWrapper(
          message: message,
          child: Container(
            padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 7),
            child: Align(
              alignment: message.byMe ? Alignment.topRight : Alignment.topLeft,
              child: _getMessageWidget(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMessageWidget() {
    return MessageCardText(message: message);
  }
}
