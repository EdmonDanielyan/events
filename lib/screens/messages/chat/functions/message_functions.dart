import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/models/chat/message.dart';

class ChatMessageFunctions {
  final BuildContext context;
  late ChatCubit _chatCubit;
  late ChatListCubit _chatListCubit;

  ChatMessageFunctions(this.context) {
    _chatCubit = BlocProvider.of<ChatCubit>(context);
    _chatListCubit = BlocProvider.of<ChatListCubit>(context);
  }

  void deleteMessages(List<Message> messages) {
    _chatCubit.deleteMessage(messages);
    _chatListCubit.updateMessages(_chatCubit.getMessages);
  }
}
