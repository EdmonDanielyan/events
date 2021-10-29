import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat/chat_screen.dart';

class ChatAppBarTitle extends StatelessWidget {
  final ChatTable chat;
  const ChatAppBarTitle({Key? key, required this.chat}) : super(key: key);

  bool get isGroup => ChatListView.isGroup(chat);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/chat_info"),
      child: Column(
        children: [
          BlocBuilder<ChatDatabaseCubit, ChatDatabaseCubitState>(
            bloc: ChatScreen.of(context).chatDatabaseCubit,
            builder: (context, state) {
              return Text(
                state.selectedChat?.name ?? "",
                style: TextStyle(fontSize: 17.0),
                textAlign: TextAlign.center,
              );
            },
          ),
          if (!isGroup) ...[
            Text(
              _strings.online,
              style: TextStyle(fontSize: 13.0, color: Colors.blueGrey[300]),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
