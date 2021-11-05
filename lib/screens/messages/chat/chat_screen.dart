import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_state.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/screens/messages/chat/components/app_bar_title.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_btn.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_textfield.dart';
import 'package:ink_mobile/screens/messages/chat/components/selective_app_bar.dart';

import 'components/body.dart';

class ChatScreen extends StatefulWidget {
  static ChatScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ChatScreenState>()!;

  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatCubit chatCubit;
  final SelectableCubit<MessageWithUser> selectableCubit;
  const ChatScreen({
    Key? key,
    required this.chatDatabaseCubit,
    required this.chatCubit,
    required this.selectableCubit,
  }) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;
  ChatCubit get chatCubit => widget.chatCubit;
  SelectableCubit<MessageWithUser> get selectableCubit =>
      widget.selectableCubit;

  @override
  void initState() {
    super.initState();

    chatCubit.updateMessages(chatDatabaseCubit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _GetAppBar(
        chatDatabaseCubit: chatDatabaseCubit,
        chatCubit: chatCubit,
        selectableCubit: selectableCubit,
      ),
      body: ChatBody(),
    );
  }
}

class _GetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatCubit chatCubit;
  final SelectableCubit<MessageWithUser> selectableCubit;
  const _GetAppBar({
    Key? key,
    required this.chatDatabaseCubit,
    required this.chatCubit,
    required this.selectableCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      bloc: chatCubit,
      buildWhen: (previous, current) {
        return previous.appBarEnum != current.appBarEnum;
      },
      builder: (context, chatCubitState) {
        return BlocBuilder<SelectableCubit<MessageWithUser>,
            SelectableCubitState<MessageWithUser>>(
          bloc: selectableCubit,
          builder: (context, selectableCubitState) {
            if (chatCubitState.appBarEnum == ChatAppBarEnums.SEARCH_BAR) {
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
          chatCubit.emitAppBarEnum(ChatAppBarEnums.INITIAL);
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
            print(selectableCubit.getItems);
            // ChatFunctions(chatDatabaseCubit)
            //     .deleteMessages(chatCubit.getSelectedMessages);
            //chatCubit.unselectAllMessages();
          },
          onSendOn: () {
            print(selectableCubit.getItems);
            // MessageFunctions(context: context)
            //     .sendOn(chatCubit.getSelectedMessages);
            // chatCubit.unselectAllMessages();
          },
        ),
      ),
    );
  }

  PreferredSizeWidget initialBar() {
    return InkAppBarWithText(
      titleWidget: ChatAppBarTitle(chat: chatDatabaseCubit.selectedChat!),
      title: "",
      actions: [
        MessageSearchBtn(
          onPressed: () {
            TextFieldUtils.loseTextFieldFocus();
            chatCubit.emitAppBarEnum(ChatAppBarEnums.SEARCH_BAR);
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
