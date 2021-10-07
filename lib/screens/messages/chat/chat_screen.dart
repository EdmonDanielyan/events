import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat/components/app_bar_title.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_btn.dart';
import 'package:ink_mobile/screens/messages/cubit/chat_list_cubit.dart';

import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = BlocProvider.of<ChatListCubit>(context);
    final Chat chat = _cubit.state.chats[_cubit.selectedChatIndex];

    return Scaffold(
      appBar: InkAppBarWithText(
        titleWidget: ChatAppBarTitle(chat: chat),
        title: "",
        actions: [MessageSearchBtn()],
      ),
      body: Body(chat: chat),
    );
  }
}
