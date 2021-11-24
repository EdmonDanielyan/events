import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_chat_btn.dart';

import 'components/body.dart';

class ChatListScreen extends StatefulWidget {
  static ChatListScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ChatListScreenState>()!;

  final ChatDatabaseCubit chatDatabaseCubit;
  final SelectableCubit<UserTable> selectableCubit;
  final ChatPersonListCubit chatPersonListCubit;
  const ChatListScreen({
    Key? key,
    required this.chatDatabaseCubit,
    required this.selectableCubit,
    required this.chatPersonListCubit,
  }) : super(key: key);

  @override
  ChatListScreenState createState() => ChatListScreenState();
}

class ChatListScreenState extends State<ChatListScreen>
    with AutomaticKeepAliveClientMixin {
  ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;
  SelectableCubit<UserTable> get selectableCubit => widget.selectableCubit;
  ChatPersonListCubit get chatPersonListCubit => widget.chatPersonListCubit;

  @override
  void initState() {
    super.initState();
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
