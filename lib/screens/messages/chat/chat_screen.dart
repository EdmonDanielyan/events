import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_state.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_modes.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/providers/messenger.dart';
import 'package:ink_mobile/screens/messages/chat/components/app_bar_title.dart';
import 'package:ink_mobile/screens/messages/chat/components/scroll_btn.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_btn.dart';
import 'package:ink_mobile/screens/messages/chat/components/selective_app_bar.dart';
import 'package:ink_mobile/setup.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'components/body.dart';
import 'entities/chat_screen_params.dart';

class ChatScreen extends StatefulWidget {
  final ChatFunctions chatFunctions;
  final ChatScreenParams chatScreenParams;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatCubit chatCubit;
  final SelectableCubit<MessageWithUser> selectableCubit;

  const ChatScreen({
    Key? key,
    required this.chatScreenParams,
    required this.chatDatabaseCubit,
    required this.chatCubit,
    required this.selectableCubit,
    required this.chatFunctions,
  }) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  ChatScreenState();

  final GlobalKey<ChatBodyState> _chatBodyStateKey = GlobalKey<ChatBodyState>();

  ScrollController controller = ScrollController();

  // ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;
  // ChatCubit get chatCubit => widget.chatCubit;
  // SelectableCubit<MessageWithUser> get selectableCubit =>
  //     widget.selectableCubit;

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
    super.dispose();
    widget.chatCubit.emitEditMessage(null);
    widget.chatCubit.emitSelectedMessageId(null);
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
            chatDatabaseCubit: widget.chatDatabaseCubit,
            chatCubit: widget.chatCubit,
            selectableCubit: widget.selectableCubit,
            chatScreenParams: widget.chatScreenParams,
          ),
          body: ChatBody(
            controller,
            widget.chatCubit,
            widget.chatDatabaseCubit,
            widget.chatScreenParams,
            widget.selectableCubit,
            key: _chatBodyStateKey,
          ),
          floatingActionButton: BlocConsumer<ChatCubit, ChatCubitState>(
            bloc: widget.chatCubit,
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
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatCubit chatCubit;
  final SelectableCubit<MessageWithUser> selectableCubit;

  const _GetAppBar({
    Key? key,
    required this.chatScreenParams,
    required this.chatDatabaseCubit,
    required this.chatCubit,
    required this.selectableCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      bloc: chatCubit,
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
        ),
      ),
    );
  }

  PreferredSizeWidget initialBar() {
    return InkAppBarWithText(
      titleWidget: chatDatabaseCubit.selectedChat != null
          ? setIgnoring(ChatAppBarTitle(
              chat: chatDatabaseCubit.selectedChat!,
              chatDatabaseCubit: chatDatabaseCubit,
              chatScreenParams: chatScreenParams,
            ))
          : null,
      title: "",
      actions: [
        MessageSearchBtn(
          onPressed: () {
            TextFieldUtils.loseTextFieldFocus();
            chatCubit.emitAppBarEnum(ChatAppBarMode.SEARCH_BAR);
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
