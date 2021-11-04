import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat/components/send_btn.dart';
import 'package:ink_mobile/screens/messages/chat/components/textfield.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

import '../chat_screen.dart';

class MessageBottomBar extends StatefulWidget {
  final ScrollController scrollController;
  const MessageBottomBar({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _MessageBottomBarState createState() => _MessageBottomBarState();
}

class _MessageBottomBarState extends State<MessageBottomBar> {
  late ChatDatabaseCubit _chatDatabaseCubit;
  ChatEntities entities = ChatEntities();
  FocusNode textfieldFocus = FocusNode();
  late ChatCubit _chatCubit;
  final _formKey = GlobalKey<FormState>();
  final _padding = 7.0;

  Future<void> onSend() async {
    if (entities.text.isNotEmpty) {
      clearForm();
      // Message message = ChatEntitiesFunctions.buildMessage(
      //   entities: entities,
      //   selectedMessageId: _chatCubit.state.selectedMessageId,
      // );

      await UseMessageProvider.messageProvider
          .sendMessage(_chatDatabaseCubit.selectedChat!, entities);
      _chatCubit.updateMessages(_chatDatabaseCubit);
      entities.clear();
      ScrollBottom(widget.scrollController).jumpLazy();
    }
  }

  void clearForm() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    _chatCubit = ChatScreen.of(context).chatCubit;
    _chatDatabaseCubit = ChatScreen.of(context).chatDatabaseCubit;
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
                      focusNode: textfieldFocus,
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
    return BlocConsumer<ChatCubit, ChatCubitState>(
      bloc: _chatCubit,
      listener: (context, state) {
        // if (state.selectedMessageId != _chatCubit.previousSelectedMessageId) {
        //   if (state.selectedMessageId != null) {
        //     textfieldFocus.requestFocus();
        //   } else {
        //     textfieldFocus.unfocus();
        //   }
        // }
      },
      builder: (context, state) {
        if (state.selectedMessageId == null) {
          return SizedBox();
        } else {
          return SizedBox();
          // Message? selectedMsg = MessageListView.getMessageById(
          //     state.selectedMessageId!, state.chat.messages);

          // if (selectedMsg == null) return SizedBox();

          // return RespondMessageContainer(
          //   horizontalPadding: _padding,
          //   selectedMessage: selectedMsg,
          //   onCancel: () => _chatCubit.emitSelectedMessageId(null),
          // );
        }
      },
    );
  }
}
