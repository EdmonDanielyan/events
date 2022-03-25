import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/bool_cubit/bool_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_state.dart';
import 'package:ink_mobile/messenger/constants/messenger_const.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/texting.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat/components/date_widget.dart';
import 'package:ink_mobile/messenger/screens/chat/components/message_card.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/chat_screen_params.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/paddings.dart';
import 'package:ink_mobile/messenger/utils/date_sort.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:moor/moor.dart' show OrderingMode;

import 'message_card_text.dart';

class MessageList extends StatefulWidget {
  final void Function()? messagesLoaded;
  final void Function()? scrollSafe;
  final ScrollController scrollController;
  final ChatScreenParams chatScreenParams;
  final SelectableCubit<MessageWithUser> selectableCubit;
  final BoolCubit emojiShown;
  final Messenger messenger;

  const MessageList({
    Key? key,
    this.messagesLoaded,
    this.scrollSafe,
    required this.messenger,
    required this.scrollController,
    required this.chatScreenParams,
    required this.selectableCubit,
    required this.emojiShown,
  }) : super(key: key);

  static List<MessageWithUser>? messagesWithUser;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> with MessageMixins {
  ScrollController get scrollController => widget.scrollController;

  Debouncer _streamDebouncer = Debouncer(milliseconds: 0);
  late int _limit;
  int _messagesLoadedCounter = 0;

  void _handleData(
    List<MessageWithUser> data,
    EventSink<List<MessageWithUser>> sink,
  ) {
    if (data.isNotEmpty && data.first.message?.userId == JwtPayload.myId) {
      sink.add(data);
    } else {
      if (_messagesLoadedCounter < 1) {
        sink.add(data);
      } else {
        _streamDebouncer.run(() {
          sink.add(data);
        });
      }
    }
  }

  Stream<List<MessageWithUser>> getStream(int limit) {
    final selectedChat = widget.messenger.chatDatabaseCubit.selectedChat;
    final String chatId = selectedChat?.id ?? "";
    if (widget.chatScreenParams.showOnlyFilesAndLinks) {
      return widget.messenger.chatDatabaseCubit.db
          .watchChatFilesMessages(chatId);
    }

    return widget.messenger.chatDatabaseCubit.db.watchChatMessages(chatId,
        orderMode: OrderingMode.desc, limit: limit, handleData: _handleData);
  }

  void _messagesLoaded() {
    _messagesLoadedCounter++;
    _streamDebouncer = Debouncer(milliseconds: 300);
    if (widget.messagesLoaded != null) {
      widget.messagesLoaded!();
    }
    widget.messenger.chatCubit
        .updateMessages(widget.messenger.chatDatabaseCubit);
  }

  @override
  void initState() {
    super.initState();
    _limit = MESSAGES_PER_PAGE_LIMIT;
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
          _limit = _limit + MESSAGES_PER_PAGE_LIMIT;
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
          dateTime:
              dateSort.getMessageDateTime(message.timestamp ?? DateTime.now()),
        ),
        MessageCard(
          messageWithUser: messageWithUser,
          index: index,
          chatDatabaseCubit: widget.messenger.chatDatabaseCubit,
          chatCubit: widget.messenger.chatCubit,
          selectableCubit: widget.selectableCubit,
          chatScreenParams: widget.chatScreenParams,
          emojiShown: widget.emojiShown,
        ),
      ],
    );
  }

  Widget _textingWidget() {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      bloc: widget.messenger.chatCubit,
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
              chatDatabaseCubit: widget.messenger.chatDatabaseCubit,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
