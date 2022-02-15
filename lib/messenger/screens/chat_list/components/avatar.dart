import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/messenger/blocs/online/online_bloc.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';

class ChatListAvatar extends StatelessWidget {
  final OnlineBloc onlineBloc;
  final ChatTable chat;
  const ChatListAvatar({Key? key, required this.onlineBloc, required this.chat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? oppositeUserId = ChatUserViewModel.getOppositeUserIdFromChat(chat);
    if (oppositeUserId != null) {
      return BlocBuilder<OnlineBloc, OnlineBlocState>(
        bloc: onlineBloc,
        builder: (context, state) => CachedCircleAvatar(
          url: chat.avatar,
          indicator: state.isOnline(oppositeUserId),
          name: chat.name,
        ),
      );
    }

    return CachedCircleAvatar(
      url: chat.avatar,
      name: chat.name,
    );
  }
}
