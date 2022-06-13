import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/message_cubit.dart';
import 'package:ink_mobile/messenger/functions/create_message.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/screens/chat/components/textfield.dart';

import 'editing_message_container.dart';
import 'responding_message_container.dart';
import 'send_btn.dart';

class MessageBottomCard extends StatefulWidget {
  final TextEditingController textEditingController;
  final Chat chat;
  final CachedChatsCubit cachedChatsCubit;
  final void Function(Message, Chat) onMessageSend;
  final MessageCubit editingMessage;
  final FocusNode focusNode;
  final void Function(Message, Chat) onMessageEdit;
  final MessageCubit respondingMessage;
  const MessageBottomCard({
    Key? key,
    required this.textEditingController,
    required this.chat,
    required this.cachedChatsCubit,
    required this.onMessageSend,
    required this.editingMessage,
    required this.focusNode,
    required this.onMessageEdit,
    required this.respondingMessage,
  }) : super(key: key);

  @override
  State<MessageBottomCard> createState() => _MessageBottomCardState();
}

class _MessageBottomCardState extends State<MessageBottomCard> {
  void _onSend() {
    final bool isResponse = widget.respondingMessage.message != null;

    final msg = CreateMessage(
      widget.textEditingController.text,
      widget.cachedChatsCubit.me,
      widget.chat.id,
      responseTo: widget.respondingMessage.message,
    ).call();

    final selectedChats = widget.cachedChatsCubit.selectedChats;

    if (msg.body.isNotEmpty && selectedChats.isNotEmpty) {
      widget.onMessageSend(msg, selectedChats.last);
    }

    if (isResponse) {
      widget.respondingMessage.set(null);
    }

    widget.textEditingController.text = "";
  }

  void _onEdit(Message message) {
    final msg = message.copyWith(body: widget.textEditingController.text);
    final selectedChats = widget.cachedChatsCubit.selectedChats;
    if (msg.body.isNotEmpty && selectedChats.isNotEmpty) {
      widget.onMessageEdit(msg, selectedChats.last);
    }
    widget.textEditingController.text = "";
    widget.editingMessage.set(null);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!.withOpacity(0.8),
              width: 1.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditingMessageContainer(editingMessage: widget.editingMessage),
            RespondingMessageContainer(
                respondingMessage: widget.respondingMessage),
            Row(
              children: [
                Expanded(
                  child: ChatTextField(
                    textEditingController: widget.textEditingController,
                    focusNode: widget.focusNode,
                  ),
                ),
                const SizedBox(width: 8.0),
                BlocBuilder<MessageCubit, Message?>(
                  bloc: widget.editingMessage,
                  builder: (context, state) {
                    return MessageSendBtn(
                      onPressed: () =>
                          state != null ? _onEdit(state) : _onSend(),
                      icon: state != null
                          ? const Icon(Icons.check)
                          : const Icon(Icons.send_rounded),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
