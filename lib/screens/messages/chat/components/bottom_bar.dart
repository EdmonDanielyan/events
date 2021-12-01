import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat/components/respond_container.dart';
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

  ChatTable get getChat => _chatDatabaseCubit.selectedChat!;

  Future<void> onSend(ChatEntities entities) async {
    if (entities.text.isNotEmpty) {
      clearForm();
      final sendMessage = SendMessage(
        chatDatabaseCubit: _chatDatabaseCubit,
        chat: getChat,
      );
      final message = await sendMessage.call(entities);
      if (UseMessageProvider.initialized) {
        UseMessageProvider.messageProvider?.chatMessageListener
            .sendMessage(getChat, message);
      }

      _chatCubit.clean();
      entities.clear();
      ScrollBottom(widget.scrollController).jumpLazy();
    }
  }

  void clearForm() {
    _formKey.currentState!.reset();
  }

  void _onMessaging(String val) {
    entities.text = val;
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
                      onChanged: _onMessaging,
                      focusNode: textfieldFocus,
                      onSend: onSend,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  MessageSendBtn(onPressed: () => onSend(entities)),
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
      listenWhen: (previous, current) {
        bool previousNotSelected = previous.selectedMessageId == null;
        bool isMessageSlected = current.selectedMessageId != null;

        return (previousNotSelected && isMessageSlected) ||
            previous.selectedMessageId != current.selectedMessageId;
      },
      listener: (context, state) {
        if (state.selectedMessageId != null) {
          textfieldFocus.requestFocus();
        } else {
          textfieldFocus.unfocus();
        }
      },
      builder: (context, state) {
        entities.repliedMessageId = state.selectedMessageId;

        if (state.selectedMessageId != null) {
          final selectedMsg =
              _chatCubit.getMessageById(state.selectedMessageId!);

          if (selectedMsg != null) {
            return RespondMessageContainer(
              horizontalPadding: _padding,
              selectedMessage: selectedMsg,
              onCancel: () => _chatCubit.emitSelectedMessageId(null),
            );
          }
        }
        return SizedBox();
      },
    );
  }
}
