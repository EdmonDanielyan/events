import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/models/chat/chat.dart';

class OpenChat {
  final BuildContext context;
  final Chat chat;
  final int index;

  OpenChat(this.context, this.chat, this.index) {
    ChatCubit _chatCubit = BlocProvider.of<ChatCubit>(context);
    ChatListCubit _chatListCubit = BlocProvider.of<ChatListCubit>(context);
    _chatCubit.emitChat(chat);
    _chatListCubit.selectedChat = index;
    Navigator.of(context).pushNamed("/message");
  }
}
