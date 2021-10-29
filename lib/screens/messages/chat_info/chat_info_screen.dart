import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

import 'components/body.dart';
import 'components/edit_btn.dart';

class ChatInfoScreen extends StatefulWidget {
  static ChatInfoScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<ChatInfoScreenState>()!;

  final ChatDatabaseCubit chatDatabaseCubit;
  const ChatInfoScreen({Key? key, required this.chatDatabaseCubit})
      : super(key: key);

  @override
  ChatInfoScreenState createState() => ChatInfoScreenState();
}

class ChatInfoScreenState extends State<ChatInfoScreen> {
  ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;

  ChatTable get chat => chatDatabaseCubit.selectedChat!;
  bool get isGroup => ChatListView.isGroup(chat);
  bool get iAmOwner => ChatListView.isOwner(chat);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return Scaffold(
      appBar: InkAppBarWithText(
        title: _strings.chatInfo,
        actions: [
          if (isGroup && iAmOwner) ...[
            ChatInfoEditBtn(),
          ],
        ],
      ),
      body: Body(chat: chat),
    );
  }
}
