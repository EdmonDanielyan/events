import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat/chat_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/edit_btn.dart';

import 'components/body.dart';

class ChatInfoScreen extends StatelessWidget {
  const ChatInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return BlocBuilder<ChatCubit, ChatCubitState>(
      builder: (BuildContext, state) {
        // final Chat chat = state.chat;
        return Scaffold(
          appBar: InkAppBarWithText(
            title: _strings.chatInfo,
            actions: [
              // if (chat.group != null) ...[
              //   ChatInfoEditBtn(),
              // ],
            ],
          ),
          //body: Body(chat: chat),
        );
      },
    );
  }
}
