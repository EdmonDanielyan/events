import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/core/cubit/bool_cubit/bool_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_state.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_state.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_state.dart';
import 'package:ink_mobile/messenger/cases/chat_functions.dart';
import 'package:ink_mobile/messenger/cases/send_message.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/chat_app_bar_modes.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat/components/app_bar_title.dart';
import 'package:ink_mobile/messenger/screens/chat/components/scroll_btn.dart';
import 'package:ink_mobile/messenger/screens/chat/components/search_btn.dart';
import 'package:ink_mobile/messenger/screens/chat/components/selective_app_bar.dart';
import 'package:ink_mobile/setup.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'components/body.dart';
import 'entities/chat_screen_params.dart';

class ChatScreen extends StatefulWidget {
  final Messenger messenger;

  static ChatScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ChatScreenState>()!;

  final ChatFunctions chatFunctions;
  final ChatScreenParams chatScreenParams;
  final SelectableCubit<MessageWithUser> selectableCubit;

  const ChatScreen({
    Key? key,
    required this.chatScreenParams,
    required this.messenger,
    required this.selectableCubit,
    required this.chatFunctions,
  }) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with WidgetsBindingObserver {
  ChatScreenState();

  SelectableCubit<MessageWithUser> get selectableCubit =>
      widget.selectableCubit;

  final GlobalKey<ChatBodyState> _chatBodyStateKey = GlobalKey<ChatBodyState>();

  ScrollController controller = ScrollController();

  final emojiShown = BoolCubit(false);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      widget.messenger.chatDatabaseCubit.isChatInBackground = true;
    }

    if (state == AppLifecycleState.resumed) {
      widget.messenger.chatDatabaseCubit.isChatInBackground = false;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    sl<NewBottomNavBarCubit>().goToPage(NavBarItems.messages);
  }

  void _setMessagesToRead() {
    if (_chatBodyStateKey.currentState != null) {
      _chatBodyStateKey.currentState!.setMessagesToRead();
    }
  }

  void _onScrollBtnClick() {
    ScrollBottom(controller).animateTo(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
    widget.messenger.chatCubit.emitEditMessage(null);
    widget.messenger.chatCubit.emitSelectedMessageId(null);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: BlocListener<ChatDatabaseCubit, ChatDatabaseCubitState>(
        listenWhen: (previous, current) => current.deletedChat,
        listener: (context, state) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: Scaffold(
          appBar: _GetAppBar(
            messenger: widget.messenger,
            selectableCubit: widget.selectableCubit,
            chatScreenParams: widget.chatScreenParams,
          ),
          body: ChatBody(
            controller,
            widget.messenger,
            widget.chatScreenParams,
            widget.selectableCubit,
            key: _chatBodyStateKey,
            emojiShown: emojiShown,
          ),
          floatingActionButton: BlocConsumer<ChatCubit, ChatCubitState>(
            bloc: widget.messenger.chatCubit,
            listenWhen: (previous, current) =>
                previous.scrollBtn && !current.scrollBtn,
            listener: (context, statue) {
              _setMessagesToRead();
            },
            buildWhen: (previous, current) {
              return previous.scrollBtn != current.scrollBtn ||
                  previous.appBarMode != current.appBarMode;
            },
            builder: (context, state) {
              return state.scrollBtn &&
                      state.appBarMode != ChatAppBarMode.SEARCH_BAR
                  ? ChatScrollBtn(onPressed: _onScrollBtnClick)
                  : const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class _GetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatScreenParams chatScreenParams;
  final SelectableCubit<MessageWithUser> selectableCubit;
  final Messenger messenger;

  const _GetAppBar({
    Key? key,
    required this.chatScreenParams,
    required this.messenger,
    required this.selectableCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      bloc: messenger.chatCubit,
      buildWhen: (previous, current) {
        return previous.appBarMode != current.appBarMode;
      },
      builder: (context, chatCubitState) {
        return BlocBuilder<SelectableCubit<MessageWithUser>,
            SelectableCubitState<MessageWithUser>>(
          bloc: selectableCubit,
          builder: (context, selectableCubitState) {
            if (selectableCubit.getItems.length > 0) {
              return selectiveBar(context);
            } else {
              return initialBar();
            }
          },
        );
      },
    );
  }

  PreferredSizeWidget selectiveBar(BuildContext context) {
    return InkAppBarWithText(
      title: "",
      titleWidget: WillPopScope(
        onWillPop: () async {
          selectableCubit.clearAll();
          return Future.value(false);
        },
        child: SelectiveAppBar(
          onDelete: () {
            final messages = MessageWithUserListView.getMessagesFromList(
                selectableCubit.getItems);
            if (sl<Messenger>().isConnected) {
              sl<Messenger>()
                  .messageEditorSender
                  .sendDeleteMessages(messages, context);
            }
            selectableCubit.clearAll();
          },
          onSendOn: () {
            final messages = MessageWithUserListView.getMessagesFromList(
                selectableCubit.getItems);
            sl<SendMessage>().sendOn(messages, context);
            selectableCubit.clearAll();
          },
        ),
      ),
    );
  }

  PreferredSizeWidget initialBar() {
    return InkAppBarWithText(
      titleWidget: messenger.chatDatabaseCubit.selectedChat != null
          ? setIgnoring(ChatAppBarTitle(
              chat: messenger.chatDatabaseCubit.selectedChat!,
              messenger: messenger,
              chatScreenParams: chatScreenParams,
            ))
          : null,
      title: "",
      actions: [
        MessageSearchBtn(
          onPressed: () {
            TextFieldUtils.loseTextFieldFocus();
            messenger.chatCubit.emitAppBarEnum(ChatAppBarMode.SEARCH_BAR);
          },
        )
      ],
    );
  }

  Widget setIgnoring(Widget child) {
    return IgnorePointer(
      ignoring: chatScreenParams.ignoreChatInfo,
      child: child,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
