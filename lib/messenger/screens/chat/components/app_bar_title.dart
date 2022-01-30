import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/online/online_bloc.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/chat_screen_params.dart';

class ChatAppBarTitle extends StatelessWidget {
  final ChatTable chat;

  final ChatScreenParams chatScreenParams;

  final Messenger messenger;

  const ChatAppBarTitle(
      {Key? key,
      required this.chat,
      required this.chatScreenParams,
      required this.messenger})
      : super(key: key);

  bool get isGroup => chat.isGroup();

  int? get oppositeUserId => ChatUserViewModel.getOppositeUserIdFromChat(chat);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/chat_info"),
      child: Column(
        children: [
          StreamBuilder<ChatTable>(
            stream: messenger.chatDatabaseCubit.db.watchChatById(chat.id),
            builder: (context, state) {
              var newChat = chat;
              if (state.hasData && state.data != null) {
                newChat = state.data!;
              }

              return Text(
                chatScreenParams.appBarText ?? (newChat.name),
                style: TextStyle(fontSize: 17.0),
                textAlign: TextAlign.center,
              );
            },
          ),
          _onlineWidget(),
        ],
      ),
    );
  }

  Widget _onlineWidget() {
    if (!isGroup) {
      final Map<bool, Widget> cacheUserStatusWidgetOfSingleChat = {};

      return BlocBuilder<OnlineBloc, OnlineBlocState>(
        bloc: messenger.onlineBloc,
        builder: (context, state) {
          var online = state.isOnline(oppositeUserId);
          return cacheUserStatusWidgetOfSingleChat.putIfAbsent(
              online,
              () => Text(
                    online
                        ? localizationInstance.online
                        : localizationInstance.offline,
                    style:
                        TextStyle(fontSize: 13.0, color: Colors.blueGrey[300]),
                    textAlign: TextAlign.center,
                  ));
        },
      );
    }
    return const SizedBox();
  }
}
