import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/screens/messages/chat/components/app_bar_title.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_btn.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_textfield.dart';
import 'package:ink_mobile/screens/messages/chat/components/selective_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/body.dart';

class ChatScreen extends StatefulWidget {
  static ChatScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ChatScreenState>()!;

  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatCubit chatCubit;
  const ChatScreen(
      {Key? key, required this.chatDatabaseCubit, required this.chatCubit})
      : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;
  ChatCubit get chatCubit => widget.chatCubit;

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
      ),
      body: ChatBody(),
    );
  }
}

class _GetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatCubit chatCubit;
  const _GetAppBar(
      {Key? key, required this.chatDatabaseCubit, required this.chatCubit})
      : super(key: key);
  static late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return BlocBuilder<ChatCubit, ChatCubitState>(
      bloc: chatCubit,
      buildWhen: (previous, current) {
        return previous.appBarEnum != current.appBarEnum;
      },
      builder: (context, state) {
        if (state.appBarEnum == ChatAppBarEnums.SEARCH_BAR) {
          return searchBar();
        } else if (chatCubit.getSelectedMessages.length > 0) {
          return selectiveBar(context);
        } else {
          return initialBar();
        }
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
          chatCubit.unselectAllMessages();
          return Future.value(false);
        },
        child: SelectiveAppBar(
          onDelete: () {
            // ChatFunctions(chatDatabaseCubit)
            //     .deleteMessages(chatCubit.getSelectedMessages);
            //chatCubit.unselectAllMessages();
          },
          onSendOn: () {
            // MessageFunctions(context: context, strings: _strings)
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
