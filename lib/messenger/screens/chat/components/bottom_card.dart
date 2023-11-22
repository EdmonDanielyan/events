import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/message_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_select_cubit/search_select_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_select_cubit/search_select_state.dart';
import 'package:ink_mobile/messenger/functions/create_message.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/screens/chat/components/builder.dart';
import 'package:ink_mobile/messenger/screens/chat/components/search_textfield.dart';
import 'package:ink_mobile/messenger/screens/chat/components/textfield.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'editing_message_container.dart';
import 'responding_message_container.dart';

class MessageBottomCard extends StatefulWidget {
  final TextEditingController textEditingController;
  final Chat chat;
  final CachedChatsCubit cachedChatsCubit;
  final SearchSelectCubit searchMessagesCubit;
  final void Function(Message, Chat) onMessageSend;
  final MessageCubit editingMessage;
  final FocusNode focusNode;
  final void Function(Message, Chat) onMessageEdit;
  final MessageCubit respondingMessage;
  final CachedUsersCubit cachedUsersCubit;
  final ItemScrollController scrollController;
  final void Function() scrollToCurrentSearchItem;
  final void Function(String, List<Message>) onSearch;

  const MessageBottomCard({
    Key? key,
    required this.textEditingController,
    required this.chat,
    required this.cachedChatsCubit,
    required this.searchMessagesCubit,
    required this.onMessageSend,
    required this.scrollToCurrentSearchItem,
    required this.onSearch,
    required this.editingMessage,
    required this.focusNode,
    required this.onMessageEdit,
    required this.respondingMessage,
    required this.cachedUsersCubit,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<MessageBottomCard> createState() => _MessageBottomCardState();
}

class _MessageBottomCardState extends State<MessageBottomCard> {
  SearchSelectCubit get searchMessagesCubit => widget.searchMessagesCubit;

  void _onSend() {
    final bool isResponse = widget.respondingMessage.message != null;

    final msg = CreateMessage(
      widget.textEditingController.text,
      widget.cachedChatsCubit.me,
      widget.chat.id,
      responseTo: widget.respondingMessage.message,
    ).call();

    final selectedChats = widget.cachedChatsCubit.selectedChats;

    widget.textEditingController.text = "";

    if (msg.body.isNotEmpty && selectedChats.isNotEmpty) {
      widget.onMessageSend(msg, selectedChats.last);
      if (widget.scrollController.isAttached) {
        widget.scrollController
            .scrollTo(index: 0, duration: const Duration(milliseconds: 300));
      }
    }

    if (isResponse) {
      widget.respondingMessage.set(null);
    }
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
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0.0, 0.0),
                blurRadius: 24,
                color: Palette.text5Grey,
                blurStyle: BlurStyle.outer)
          ],
        ),
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
        child: BlocBuilder<SearchSelectCubit, SearchSelectState>(
          bloc: widget.searchMessagesCubit,
          builder: (context, state) {
            bool isSearching = state.enabled;
            return WillPopScope(
              onWillPop: () async {
                searchMessagesCubit.state.enabled
                    ? searchMessagesCubit.enable(false)
                    : Navigator.pop(context);
                return false;
              },
              child: isSearching
                  ? ChatBuilder(
                      cachedChatsCubit: widget.cachedChatsCubit,
                      builder: (context, state, chat) {
                        if (chat == null) {
                          return const SizedBox.shrink();
                        }
                        return ChatSearchTextField(
                          onUp: () {
                            searchMessagesCubit.toPrevious();
                            widget.scrollToCurrentSearchItem();
                          },
                          onDown: () {
                            searchMessagesCubit.toNext();
                            widget.scrollToCurrentSearchItem();
                          },
                          onFieldSubmitted: (str) =>
                              widget.onSearch(str, chat.messages),
                          onClose: () => searchMessagesCubit.enable(false),
                          currentIndex: searchMessagesCubit.currentIndex,
                          itemsLength: searchMessagesCubit.itemsLength,
                        );
                      },
                    )
                  : _chatField(),
            );
          },
        ),
      ),
    );
  }

  Widget _chatField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditingMessageContainer(editingMessage: widget.editingMessage),
          RespondingMessageContainer(
            respondingMessage: widget.respondingMessage,
          ),
          Row(
            children: [
              Expanded(
                child: ChatTextField(
                  textEditingController: widget.textEditingController,
                  focusNode: widget.focusNode,
                ),
              ),
              const SizedBox(width: 16.0),
              BlocBuilder<MessageCubit, Message?>(
                bloc: widget.editingMessage,
                builder: (context, state) {
                  return InkWell(
                    onTap: () => state != null ? _onEdit(state) : _onSend(),
                    child: SvgPicture.asset(
                        state != null
                            ? IconLinks.TICK_ICON
                            : IconLinks.SEND_ICON,
                        height: 28.0,
                        width: 28.0,
                        colorFilter: ColorFilter.mode(
                            Palette.greenE4A, BlendMode.srcIn)),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
