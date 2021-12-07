import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
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
  TextEditingController _messageTextEditingController = TextEditingController();
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
        UseMessageProvider.messageProvider?.textSender
            .sendMessage(getChat, message);
      }

      _chatCubit.clean();
      entities.clear();
      ScrollBottom(widget.scrollController).jumpLazy();
    }
  }

  Future<void> onEdit(MessageWithUser messageWithUser) async {
    final editedMsg =
        MessageListView.editMessage(messageWithUser.message!, entities.text);

    if (UseMessageProvider.initialized) {
      clearForm();
      final sent = await UseMessageProvider
              .messageProvider?.messageEditorSender
              .sendDeleteMessages([editedMsg], context, edited: true) ??
          false;

      if (sent) {
        _chatDatabaseCubit.db.updateMessageById(editedMsg.id, editedMsg);
        _chatCubit.emitEditMessage(null);
      }
    }
  }

  void clearForm() {
    _formKey.currentState!.reset();
    _messageTextEditingController.text = "";
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
              _editContainerWidget(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: MessageTextfield(
                      textEditingController: _messageTextEditingController,
                      onChanged: _onMessaging,
                      focusNode: textfieldFocus,
                      onSend: onSend,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  _btnWidget(),
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

  Widget _editContainerWidget() {
    return BlocConsumer<ChatCubit, ChatCubitState>(
      bloc: _chatCubit,
      listenWhen: (previous, current) {
        bool previousNotEdited = previous.editMessage == null;
        bool isMessageEditing = current.editMessage != null;
        return (previousNotEdited && isMessageEditing) ||
            previous.editMessage != current.editMessage;
      },
      listener: (context, state) {
        if (state.editMessage != null) {
          _messageTextEditingController.text =
              state.editMessage!.message?.message ?? "";
          _messageTextEditingController.selection = TextSelection.fromPosition(
              TextPosition(offset: _messageTextEditingController.text.length));
          textfieldFocus.requestFocus();
        } else {
          textfieldFocus.unfocus();
        }
      },
      builder: (context, state) {
        if (state.editMessage != null) {
          return RespondMessageContainer(
            horizontalPadding: _padding,
            selectedMessage: state.editMessage!,
            onCancel: () {
              _chatCubit.emitEditMessage(null);
              _messageTextEditingController.text = "";
            },
          );
        }
        return SizedBox();
      },
    );
  }

  Widget _btnWidget() {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      bloc: _chatCubit,
      buildWhen: (previous, current) {
        return previous.editMessage != current.editMessage;
      },
      builder: (context, state) {
        if (state.editMessage != null) {
          return MessageSendBtn(
            icon: Icon(Icons.check),
            onPressed: () {
              onEdit(state.editMessage!);
            },
          );
        }

        return MessageSendBtn(onPressed: () => onSend(entities));
      },
    );
  }
}
