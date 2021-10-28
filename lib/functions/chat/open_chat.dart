import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

class OpenChat {
  final ChatTable chatTable;
  final ChatDatabaseCubit chatDatabaseCubit;

  OpenChat(this.chatDatabaseCubit, this.chatTable);

  void call(BuildContext context) {
    chatDatabaseCubit.setSelectedChat(chatTable);
    Future.delayed(Duration(milliseconds: 200), () {
      Navigator.of(context).pushNamed("/message");
    });
  }
}
