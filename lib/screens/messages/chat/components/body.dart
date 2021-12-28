import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_modes.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat/components/bottom_bar.dart';
import 'package:ink_mobile/screens/messages/chat/components/message_list.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_textfield.dart';
import 'package:ink_mobile/setup.dart';

import '../chat_screen.dart';

class ChatBody extends StatefulWidget {
  final ScrollController controller;

  const ChatBody({Key? key, required this.controller}) : super(key: key);

  @override
  ChatBodyState createState() => ChatBodyState();
}

class ChatBodyState extends State<ChatBody> with MessageMixins {
  ScrollController get controller => widget.controller;
  late KeyboardVisibilityController keyboardVisibilityController;
  int loadedMessagesCount = 0;
  late ChatCubit chatCubit;

  List<MessageWithUser> loadedMessagesWithUser = [];

  void keyboardListener() {
    keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((visible) {
      if (visible) bottomGapScroll(controller);
    });
  }

  void setMessagesToRead() {
    loadedMessagesWithUser = MessageList.messagesWithUser ?? [];

    final messages =
        MessageListView.messageWithUsersToMessage(loadedMessagesWithUser);

    final lastNotReadMessage = MessageListView.oppositeNotReadMessage(messages);
    if (lastNotReadMessage != null && sl<Messenger>().isConnected) {
      sl<Messenger>().userReactionSender.setMessagesToReadNats(
        [lastNotReadMessage],
      );
    }
  }

  void _scrollSafe() {
    if (this.mounted && isInBottom(controller, gap: 20)) {
      _scrollBottom();
    }
  }

  void _scrollBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      ScrollBottom(controller).jump();
    });
  }

  void _onMessagesLoaded() {
    loadedMessagesCount++;
    if (loadedMessagesCount == 1 || isInBottom(controller, gap: 100)) {
      _scrollBottom();
      setMessagesToRead();
    }
  }

  void _scrollListener() {
    if (isInBottom(controller, gap: 100)) {
      if (chatCubit.scrollBtn) {
        chatCubit.setScrollBtn(false);
      }
    } else if ((MessageList.messagesWithUser?.length ?? 0) > 15) {
      chatCubit.setScrollBtn(true);
    }
  }

  @override
  void initState() {
    super.initState();

    keyboardListener();
    Future.delayed(Duration.zero, () {
      controller.addListener(() {
        _scrollListener();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    chatCubit = ChatScreen.of(context).chatCubit;
    final chatScreenParams = ChatScreen.of(context).chatScreenParams;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ChatCubit, ChatCubitState>(
          bloc: chatCubit,
          builder: (context, state) {
            if (state.appBarMode == ChatAppBarMode.SEARCH_BAR) {
              return searchBar(context);
            }
            return SizedBox();
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: controller,
            child: MessageList(
              messagesLoaded: _onMessagesLoaded,
              scrollSafe: _scrollSafe,
              scrollController: controller,
            ),
          ),
        ),
        if (chatScreenParams.showTextField) ...[
          BlocBuilder<ChatCubit, ChatCubitState>(
            bloc: chatCubit,
            builder: (context, state) {
              if (state.appBarMode != ChatAppBarMode.SEARCH_BAR) {
                return MessageBottomBar(scrollController: controller);
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ],
    );
  }

  Widget searchBar(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        chatCubit.emptySearch();
        chatCubit.emitAppBarEnum(ChatAppBarMode.INITIAL);
        return Future.value(false);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: ChatSearchTextfield(
          onFieldSubmitted: (val) => chatCubit.emitSearchValue(val),
          onUp: () => chatCubit.upSearch(),
          onDown: () => chatCubit.downSearch(),
        ),
      ),
    );
  }
}
