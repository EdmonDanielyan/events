import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

class OpenChat {
  final BuildContext context;
  final ChatTable chat;

  OpenChat(this.context, this.chat) {
    ChatCubit _chatCubit = BlocProvider.of<ChatCubit>(context);
    _chatCubit.emitChat(chat.id!);
    Navigator.of(context).pushNamed("/message");
  }
}
