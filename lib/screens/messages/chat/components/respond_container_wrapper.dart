import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat/components/respond_container.dart';

class RespondContainerWrapper extends StatelessWidget {
  final Widget child;
  final Message message;
  final Color? textColor;
  const RespondContainerWrapper({
    Key? key,
    required this.child,
    required this.message,
    this.textColor,
  }) : super(key: key);

  static late ChatCubit _chatCubit;

  Color get myTxtColor => message.byMe ? Colors.white : Colors.black;

  Color get bgColorDarker =>
      message.byMe ? Color(0XFF3e8b64) : Colors.grey.shade300;

  CrossAxisAlignment get crossAxisAlignment =>
      message.byMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

  Message? get selectedMessage => null;
  //  MessageListView.getMessageById(
  //     message.selectedMessageId!, _chatCubit.state.chat.messages);

  @override
  Widget build(BuildContext context) {
    _chatCubit = BlocProvider.of<ChatCubit>(context);

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (message.selectedMessageId != null && selectedMessage != null) ...[
          RespondMessageContainer(
            selectedMessage: selectedMessage!,
            bgColor: bgColorDarker,
            txtColor:
                textColor?.withOpacity(0.8) ?? myTxtColor.withOpacity(0.8),
          ),
          SizedBox(height: 5.0),
        ],
        child,
      ],
    );
  }
}
