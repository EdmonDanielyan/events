import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_state.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/send_message.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat/components/respond_container.dart';
import 'package:ink_mobile/messenger/screens/chat/components/send_btn.dart';
import 'package:ink_mobile/messenger/screens/chat/components/textfield.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/form_entities.dart';
import 'package:ink_mobile/setup.dart';

class MessageBottomBar extends StatefulWidget {
  final ScrollController scrollController;

  final ChatDatabaseCubit chatDatabaseCubit;

  final ChatCubit chatCubit;

  const MessageBottomBar(
      this.chatDatabaseCubit, this.chatCubit, this.scrollController,
      {Key? key})
      : super(key: key);

  @override
  _MessageBottomBarState createState() => _MessageBottomBarState();
}

class _MessageBottomBarState extends State<MessageBottomBar> with Loggable {
  final ChatEntities entities = ChatEntities();
  final FocusNode textfieldFocus = FocusNode();
  final TextEditingController _messageTextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _padding = 7.0;

  _MessageBottomBarState();

  ChatTable? get getChat => widget.chatDatabaseCubit.selectedChat;

  Future<void> onSend() async {

    final currentChat = getChat?.copyWith();
    if (entities.text.isNotEmpty && currentChat != null) {
      final saveEntities = entities.copyWith();
      logger.finest(() => "onSend: $saveEntities");
      clearForm();
      final sendMessage = sl<SendMessage>();
      final message = await sendMessage.save(currentChat, saveEntities);
      if (sl<Messenger>().isConnected) {
        await sl<Messenger>().textSender.sendMessage(currentChat, message);
      }

      widget.chatCubit.clean();

      ScrollBottom(widget.scrollController).jumpLazy();
    }
  }

  Future<void> onEdit(MessageWithUser messageWithUser) async {
    final editedMsg =
        MessageListView.editMessage(messageWithUser.message!, entities.text);

    if (sl<Messenger>().isConnected) {
      clearForm();
      if (editedMsg.message.trim().isNotEmpty) {
        final sent = await sl<Messenger>()
            .messageEditorSender
            .sendDeleteMessages([editedMsg], context, edited: true);

        if (sent) {
          widget.chatDatabaseCubit.db
              .updateMessageById(editedMsg.id, editedMsg);
          widget.chatCubit.emitEditMessage(null);
        }
      } else {
        widget.chatCubit.emitEditMessage(null);
      }
    }
  }

  void clearForm() {
    _formKey.currentState!.reset();
    _messageTextEditingController.text = "";
    entities.clear();
  }

  void _onMessaging(String val) {
    entities.text = val.trim();
  }

  @override
  Widget build(BuildContext context) {
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
      bloc: widget.chatCubit,
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
              widget.chatCubit.getMessageById(state.selectedMessageId!);

          if (selectedMsg != null) {
            return RespondMessageContainer(
              horizontalPadding: _padding,
              selectedMessage: selectedMsg,
              onCancel: () => widget.chatCubit.emitSelectedMessageId(null),
            );
          }
        }
        return SizedBox();
      },
    );
  }

  Widget _editContainerWidget() {
    return BlocConsumer<ChatCubit, ChatCubitState>(
      bloc: widget.chatCubit,
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
              widget.chatCubit.emitEditMessage(null);
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
      bloc: widget.chatCubit,
      buildWhen: (previous, current) {
        return previous.editMessage != current.editMessage;
      },
      builder: (context, state) {
        if (state.editMessage != null) {
          return MessageSendBtn(
            icon: const Icon(Icons.check),
            onPressed: () {
              onEdit(state.editMessage!);
            },
          );
        }

        return MessageSendBtn(onPressed: onSend);
      },
    );
  }
}
