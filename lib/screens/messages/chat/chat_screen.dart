import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/chat.dart';
import 'package:ink_mobile/screens/messages/chat/components/app_bar_title.dart';
import 'package:ink_mobile/screens/messages/chat/components/search_btn.dart';

import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  final Chat chat;
  const ChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Scaffold(
      appBar: InkAppBarWithText(
        titleWidget: ChatAppBarTitle(
          title: chat.chatName,
          subtitle: chat.online ? _strings.online : null,
        ),
        title: "",
        actions: [MessageSearchBtn()],
      ),
      body: Body(),
    );
  }
}
