import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat/entities/chat_screen_params.dart';

class OpenChat {
  final ChatTable chatTable;
  final ChatDatabaseCubit chatDatabaseCubit;

  OpenChat(this.chatDatabaseCubit, this.chatTable);

  Future<void> call(BuildContext context,
      {ChatScreenParams? chatScreenParams}) async {
    chatDatabaseCubit.setSelectedChat(chatTable);
    final params = chatScreenParams ?? ChatScreenParams();
    await Navigator.of(context).pushNamed(
      "/message",
      arguments: params,
    );
    if (chatDatabaseCubit.selectedChat != null &&
        chatDatabaseCubit.selectedChat!.id == chatTable.id) {
      chatDatabaseCubit.setSelectedChat(null);
    }
  }
}
