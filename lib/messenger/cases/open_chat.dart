import 'package:flutter/material.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/chat_screen_params.dart';

class OpenChat {
  final ChatTable chatTable;
  final ChatDatabaseCubit chatDatabaseCubit;

  OpenChat(this.chatDatabaseCubit, this.chatTable);

  Future<void> call({ChatScreenParams? chatScreenParams}) async {
    final currentSelectedChat = chatDatabaseCubit.selectedChat;

    chatDatabaseCubit.setSelectedChat(chatTable);
    final params = chatScreenParams ?? ChatScreenParams();
    BuildContext? context = App.getContext;
    if (context != null) {
      await Navigator.of(context).pushNamed(
        "/message",
        arguments: params,
      );
      if (chatDatabaseCubit.selectedChat != null &&
          chatDatabaseCubit.selectedChat!.id == chatTable.id) {
        chatDatabaseCubit.setSelectedChat(currentSelectedChat);
      }
    }
  }
}
