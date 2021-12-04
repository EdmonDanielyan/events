import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_state.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_modes.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat/components/app_bar_title.dart';
import 'package:ink_mobile/screens/messages/chat/components/scroll_btn.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_btn.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_textfield.dart';
import 'package:ink_mobile/screens/messages/chat/components/selective_app_bar.dart';

import 'components/body.dart';
import 'entities/chat_screen_params.dart';

class ChatScreen extends StatefulWidget {
  final ChatFunctions chatFunctions;

  static ChatScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ChatScreenState>()!;

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
  ChatScreenState createState() => ChatScreenState(chatScreenParams);
}

class ChatScreenState extends State<ChatScreen> {
  final ChatScreenParams chatScreenParams;
  ChatScreenState(this.chatScreenParams);

  ScrollController controller = ScrollController();

  ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;
  ChatCubit get chatCubit => widget.chatCubit;
  SelectableCubit<MessageWithUser> get selectableCubit =>
      widget.selectableCubit;

  void _onScrollBtnClick() {
    ScrollBottom(controller).animateTo(duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _GetAppBar(
        chatDatabaseCubit: chatDatabaseCubit,
        chatCubit: chatCubit,
        selectableCubit: selectableCubit,
        chatScreenParams: chatScreenParams,
      ),
      body: ChatBody(controller: controller, chatFunctions: widget.chatFunctions,),
      floatingActionButton: BlocBuilder<ChatCubit, ChatCubitState>(
        bloc: chatCubit,
        buildWhen: (previous, current) {
          return previous.scrollBtn != current.scrollBtn;
        },
        builder: (context, state) {
          return state.scrollBtn
              ? ChatScrollBtn(onPressed: _onScrollBtnClick)
              : SizedBox();
        },
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
            if (chatCubitState.appBarMode == ChatAppBarMode.SEARCH_BAR) {
              return searchBar();
            } else if (selectableCubit.getItems.length > 0) {
              return selectiveBar(context);
            } else {
              return initialBar();
            }
          },
        );
      },
    );
  }

  PreferredSizeWidget searchBar() {
    return InkAppBarWithText(
      title: "",
      titleWidget: WillPopScope(
        onWillPop: () async {
          chatCubit.emptySearch();
          chatCubit.emitAppBarEnum(ChatAppBarMode.INITIAL);
          return Future.value(false);
        },
        child: ChatSearchTextfield(
          onFieldSubmitted: (val) => chatCubit.emitSearchValue(val),
          onUp: () => chatCubit.upSearch(),
          onDown: () => chatCubit.downSearch(),
        ),
      ),
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
            if (UseMessageProvider.initialized) {
              UseMessageProvider.messageProvider?.messageEditorSender
                  .sendDeleteMessages(messages, context);
            }
            selectableCubit.clearAll();
          },
          onSendOn: () {
            final messages = MessageWithUserListView.getMessagesFromList(
                selectableCubit.getItems);
            ChatCreation.sendOn(messages, context);
            selectableCubit.clearAll();
          },
        ),
      ),
    );
  }

  PreferredSizeWidget initialBar() {
    return InkAppBarWithText(
      titleWidget: setIgnoring(ChatAppBarTitle(
        chat: chatDatabaseCubit.selectedChat!,
        chatDatabaseCubit: chatDatabaseCubit,
      )),
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
