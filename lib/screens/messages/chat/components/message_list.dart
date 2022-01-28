import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/date_sort.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/screens/messages/chat/components/date_widget.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_card.dart';
import 'package:ink_mobile/screens/messages/chat/entities/chat_screen_params.dart';
import 'package:ink_mobile/screens/messages/chat/entities/paddings.dart';
import 'package:moor/moor.dart' show OrderingMode;

import 'message_card_text.dart';

class MessageList extends StatefulWidget {
  final void Function()? messagesLoaded;
  final void Function()? scrollSafe;
  final ScrollController scrollController;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatScreenParams chatScreenParams;
  final ChatCubit chatCubit;
  final SelectableCubit<MessageWithUser> selectableCubit;

  const MessageList({
    Key? key,
    this.messagesLoaded,
    this.scrollSafe,
    required this.scrollController,
    required this.chatDatabaseCubit,
    required this.chatScreenParams,
    required this.chatCubit,
    required this.selectableCubit,
  }) : super(key: key);

  static List<MessageWithUser>? messagesWithUser;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> with MessageMixins {
  ScrollController get scrollController => widget.scrollController;

  final int _fixedLimit = 20;

  late int _limit;

  Stream<List<MessageWithUser>> getStream(int limit) {
    final selectedChat = widget.chatDatabaseCubit.selectedChat;
    final String chatId = selectedChat?.id ?? "";
    if (widget.chatScreenParams.showOnlyFilesAndLinks) {
      return widget.chatDatabaseCubit.db.watchChatFilesMessages(chatId);
    }

    return widget.chatDatabaseCubit.db
        .watchChatMessages(chatId, orderMode: OrderingMode.desc, limit: limit);
  }

  void _messagesLoaded() {
    if (widget.messagesLoaded != null) {
      widget.messagesLoaded!();
    }
    widget.chatCubit.updateMessages(widget.chatDatabaseCubit);
  }

  @override
  void initState() {
    super.initState();
    _limit = _fixedLimit;
    scrollController.addListener(() {
      _listenToScroll();
    });
  }

  void _listenToScroll() {
    if (scrollController.position.atEdge) {
      bool isTop = scrollController.position.pixels == 0;

      if (isTop &&
          MessageList.messagesWithUser != null &&
          MessageList.messagesWithUser!.length >= _limit) {
        setState(() {
          _limit = _limit + _fixedLimit;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
              stream: getStream(_limit),
              builder:
                  (context, AsyncSnapshot<List<MessageWithUser>> snapshot) {
                if (snapshot.hasData) {
                  MessageList.messagesWithUser =
                      snapshot.data?.reversed.toList() ?? [];
                  DateTimeSort dateSort = DateTimeSort();

                  if (MessageList.messagesWithUser!.length > 0) {
                    _messagesLoaded();

                    return ListView.builder(
                      controller: ScrollController(keepScrollOffset: true),
                      itemCount: MessageList.messagesWithUser!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return eachItem(
                          MessageList.messagesWithUser![index],
                          dateSort,
                          index,
                        );
                      },
                    );
                  }
                }

                return const SizedBox();
              },
            ),
            _textingWidget(),
          ],
        ),
      ),
    );
  }

  Widget eachItem(
      MessageWithUser messageWithUser, DateTimeSort dateSort, int index) {
    MessageTable message = messageWithUser.message!;

    return Column(
      children: [
        DateWidget(
          dateTime: dateSort.getMessageDateTime(message.createAtAsLocalDateTime),
        ),
        MessageCard(
          messageWithUser: messageWithUser,
          index: index,
          chatDatabaseCubit: widget.chatDatabaseCubit,
          chatCubit: widget.chatCubit,
          selectableCubit: widget.selectableCubit,
          chatScreenParams: widget.chatScreenParams,
        ),
      ],
    );
  }

  Widget _textingWidget() {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      bloc: widget.chatCubit,
      buildWhen: (previous, current) {
        return previous.texting != current.texting;
      },
      builder: (context, state) {
        if (state.texting != null &&
            state.texting!.customTextingEnum != CustomTextingEnum.EMPTY) {
          if (widget.scrollSafe != null) {
            widget.scrollSafe!();
          }
          return Container(
            padding: ChatScreenPaddings.messageContainerPadding,
            child: MessageCardText(
              user: state.texting!.user,
              messageStr: "...",
              message: null,
              chatDatabaseCubit: widget.chatDatabaseCubit,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
