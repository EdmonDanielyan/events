import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_chat_btn.dart';

import 'components/body.dart';

class ChatListScreen extends StatefulWidget {
  static ChatListScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ChatListScreenState>()!;

  final ChatDatabaseCubit chatDatabaseCubit;
  const ChatListScreen({Key? key, required this.chatDatabaseCubit})
      : super(key: key);

  @override
  ChatListScreenState createState() => ChatListScreenState();
}

class ChatListScreenState extends State<ChatListScreen>
    with AutomaticKeepAliveClientMixin {
  ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;

  @override
  void initState() {
    super.initState();
    ChatCreation(chatDatabaseCubit).addCustomUser();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: InkAppBarWithText(
        title: localizationInstance.messages,
        actions: [NewChatBtn()],
      ),
      body: Body(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
