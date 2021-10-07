import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/screens/messages/chat/components/app_bar_title.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_btn.dart';

import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(
        titleWidget: BlocBuilder<ChatCubit, ChatCubitState>(
          builder: (BuildContext context, state) {
            return ChatAppBarTitle(chat: state.chat);
          },
        ),
        title: "",
        actions: [MessageSearchBtn()],
      ),
      body: Body(),
    );
  }
}
