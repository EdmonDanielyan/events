import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/edit_btn.dart';
import 'package:ink_mobile/screens/messages/cubit/chat_list_cubit.dart';

import 'components/body.dart';

class ChatInfoScreen extends StatelessWidget {
  const ChatInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    final _cubit = BlocProvider.of<ChatListCubit>(context);
    final Chat chat = _cubit.state.chats[_cubit.selectedChatIndex];
    return Scaffold(
      appBar: InkAppBarWithText(
        title: _strings.chatInfo,
        actions: [
          if (chat.group != null) ...[
            ChatInfoEditBtn(),
          ],
        ],
      ),
      body: Body(chat: chat),
    );
  }
}
