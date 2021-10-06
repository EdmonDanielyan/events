import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/chat/chat.dart';

import 'components/body.dart';

class ChatInfoScreen extends StatelessWidget {
  final Chat chat;
  const ChatInfoScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Scaffold(
      appBar: InkAppBarWithText(
        title: _strings.chatInfo,
        actions: [
          if (chat.group != null) ...[
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          ],
        ],
      ),
      body: Body(chat: chat),
    );
  }
}
