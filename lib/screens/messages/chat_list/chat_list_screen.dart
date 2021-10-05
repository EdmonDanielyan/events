import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/new_chat_btn.dart';
import 'package:ink_mobile/screens/messages/chat_list/cubit/chat_list_cubit.dart';

import 'components/body.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return BlocProvider(
      create: (context) => ChatListCubit(),
      child: Scaffold(
        appBar: InkAppBarWithText(
          title: _strings.messages,
          actions: [NewChatBtn()],
        ),
        body: Body(),
      ),
    );
  }
}
