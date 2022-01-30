import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/functions/message_mixins.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_state.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/chat_app_bar_modes.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/providers/notifications/notifications.dart';
import 'package:ink_mobile/messenger/screens/chat/components/bottom_bar.dart';
import 'package:ink_mobile/messenger/screens/chat/components/message_list.dart';
import 'package:ink_mobile/messenger/screens/chat/components/search_textfield.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/chat_screen_params.dart';
import 'package:ink_mobile/setup.dart';

class ChatBody extends StatefulWidget {
  final ScrollController controller;


  final ChatScreenParams chatScreenParams;

  final SelectableCubit<MessageWithUser> selectableCubit;

  final Messenger messenger;

  const ChatBody(this.controller, this.messenger,
      this.chatScreenParams, this.selectableCubit,
      {Key? key})
      : super(key: key);

  @override
  ChatBodyState createState() => ChatBodyState();
}

class ChatBodyState extends State<ChatBody> with MessageMixins {
  ScrollController get controller => widget.controller;
  late KeyboardVisibilityController keyboardVisibilityController;
  int loadedMessagesCount = 0;
  final LocalNotificationsProvider notificationsProvider =
      sl<LocalNotificationsProvider>();

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

  void _scrollBottom({int milliseconds = 50}) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      ScrollBottom(controller).jump();
    });
  }

  void _onMessagesLoaded() {
    loadedMessagesCount++;
    if (isInBottom(controller, gap: 100)) {
      _scrollBottom();
      setMessagesToRead();
      _hideNotifications();
    }

    _scrollListener();
  }

  void _hideNotifications() {
    if (widget.messenger.chatDatabaseCubit.selectedChat != null) {
      final chatId = widget.messenger.chatDatabaseCubit.selectedChat?.id;
      if (chatId != null) {
        notificationsProvider.cancelNotification(chatId.hashCode);
      }
    }
  }

  void _scrollListener() {
    if (isInBottom(controller, gap: 100)) {
      if (widget.messenger.chatCubit.scrollBtn) {
        widget.messenger.chatCubit.setScrollBtn(false);
      }
    } else if ((MessageList.messagesWithUser?.length ?? 0) > 15) {
      widget.messenger.chatCubit.setScrollBtn(true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.messenger.chatCubit.setScrollBtn(false);
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
    _scrollBottom(milliseconds: 400);

    _hideNotifications();
  }

  Widget? _messageBar;

  Widget get messageBar =>
      _messageBar ??
      (_messageBar = MessageBottomBar(
          widget.messenger.chatDatabaseCubit, widget.messenger.chatCubit, widget.controller));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ChatCubit, ChatCubitState>(
          bloc: widget.messenger.chatCubit,
          builder: (context, state) {
            if (state.appBarMode == ChatAppBarMode.SEARCH_BAR) {
              return searchBar;
            }
            return const SizedBox();
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: controller,
            physics: BouncingScrollPhysics(),
            child: MessageList(
              messagesLoaded: _onMessagesLoaded,
              scrollSafe: _scrollSafe,
              scrollController: controller,
              messenger: widget.messenger,
              selectableCubit: widget.selectableCubit,
              chatScreenParams: widget.chatScreenParams,
            ),
          ),
        ),
        if (widget.chatScreenParams.showTextField) ...[messageBar],
      ],
    );
  }

  Widget? _searchBar;

  Widget get searchBar =>
      _searchBar ??
      (_searchBar = WillPopScope(
        onWillPop: () async {
          widget.messenger.chatCubit.emptySearch();
          widget.messenger.chatCubit.emitAppBarEnum(ChatAppBarMode.INITIAL);
          return Future.value(false);
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: ChatSearchTextfield(
            onFieldSubmitted: (val) => widget.messenger.chatCubit.emitSearchValue(val),
            onUp: () => widget.messenger.chatCubit.upSearch(),
            onDown: () => widget.messenger.chatCubit.downSearch(),
            onClose: () {
              widget.messenger.chatCubit.emptySearch();
              widget.messenger.chatCubit.emitAppBarEnum(ChatAppBarMode.INITIAL);
            },
          ),
        ),
      ));
}
