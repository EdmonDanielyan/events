import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/screens/messages/chat/components/respond_container.dart';
import 'package:ink_mobile/screens/messages/chat/components/send_btn.dart';
import 'package:ink_mobile/screens/messages/chat/components/textfield.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

class MessageBottomBar extends StatefulWidget {
  final ScrollController scrollController;
  const MessageBottomBar({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _MessageBottomBarState createState() => _MessageBottomBarState();
}

class _MessageBottomBarState extends State<MessageBottomBar> {
  ChatEntities entities = ChatEntities();
  late ChatCubit _chatCubit;
  late ChatListCubit _chatListCubit;
  final _formKey = GlobalKey<FormState>();
  final _padding = 7.0;

  void onSend() {
    if (entities.text.isNotEmpty) {
      clearForm();
      Message message = ChatEntitiesFunctions.buildMessage(entities);
      _chatCubit.addMessage(message);
      _chatListCubit.reAddChat(_chatCubit.state.chat);
      ScrollBottom(widget.scrollController).jumpLazy();
    }
  }

  void clearForm() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    _chatCubit = BlocProvider.of<ChatCubit>(context);
    _chatListCubit = BlocProvider.of<ChatListCubit>(context);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(bottom: _padding),
        width: double.infinity,
        padding: EdgeInsets.only(
          left: _padding,
          top: _padding,
          right: _padding,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!.withOpacity(0.8),
              width: 1.0,
            ),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _respondContainerWidget(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: MessageTextfield(
                      onChanged: (val) => entities.text = val,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  MessageSendBtn(onPressed: onSend),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _respondContainerWidget() {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      builder: (BuildContext, state) {
        if (state.selectedMessage == null) {
          return SizedBox();
        } else {
          return RespondMessageContainer(
            horizontalPadding: _padding,
            selectedMessage: state.selectedMessage!,
            onCancel: () => _chatCubit.emitSelectedMessage(null),
          );
        }
      },
    );
  }
}
