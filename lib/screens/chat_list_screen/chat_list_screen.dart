import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/string_cubit.dart';
import 'package:ink_mobile/messenger/handler/create_chat.dart';
import 'package:ink_mobile/messenger/handler/remove_chat_handler.dart';
import 'package:ink_mobile/messenger/handler/senders/remove_participant_sender_handler.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/chat/opener.dart';
import 'package:ink_mobile/messenger/screens/chat_list/chat_list_screen.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/routes/routes.dart';
import 'package:ink_mobile/setup.dart';
import '../../messenger/cubits/cached/chat_users_picker/chat_users_picker_cubit.dart';
import '../../messenger/cubits/cached/users/cached_users_cubit.dart';
import '../../messenger/cubits/custom/online_cubit/online_cubit.dart';
import '../../messenger/model/chat.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen>
    with AutomaticKeepAliveClientMixin {
  final chatsCubit = getIt<CachedChatsCubit>();
  final createChat = StringCubit("");
  final onlineCubit = getIt<OnlineCubit>();
  final cachedUsersCubit = getIt<CachedUsersCubit>();
  final chatUsersPickerCubit = getIt<ChatUsersPickerCubit>();
  final chatPersonListCubit = ChatPersonListCubit();

  void _newUsers(List<User> users) {
    final pickUsers = List<User>.from(users)
      ..removeWhere((el) => el.id == JwtPayload.myId);

    chatUsersPickerCubit.setUsers(pickUsers);
    cachedUsersCubit.addUsers(users);
  }

  void _onType(String query, Chat? chat) {
    chatPersonListCubit.setSearchValue(query);
  }

  @override
  void initState() {
    super.initState();
    chatPersonListCubit.addListener(_newUsers);
    chatPersonListCubit.init();
    chatUsersPickerCubit.addListenerToTyping(_onType);
  }

  void _createChat(List<User> users, BuildContext context) {
    CreateChatHandler(
      users,
      context,
      chatsCubit: chatsCubit,
      onlineCubit: onlineCubit,
      cachedUsersCubit: cachedUsersCubit,
    ).call();
  }

  void _onCreateChat() {
    createChat.setNew("");
    Navigator.pushNamed(context, MainRoutes.usersPickerScreenKey).then((users) {
      if (users is List<User>) _createChat(users, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onCreateChat,
        child: SvgPicture.asset(
          IconLinks.EDIT_ICON,
          color: Palette.white,
        ),
        backgroundColor: Palette.greenE4A,
      ),
      appBar: InkAppBar(
        context,
        title: "Сообщения",
        leading: const SizedBox.shrink(),
        showPersonalPageLink: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatList(
              cubit: chatsCubit,
              onDismissed: (chat) {
                RemoveParticipantHandler(chat, chatsCubit.myId, [chatsCubit.me])
                    .call();
                RemoveChatHandler(chat)();
              },
              onTap: (chat) => ChatScreenOpener(
                context,
                chat.id,
                chatsCubit,
                onlineCubit: onlineCubit,
                cachedUsersCubit: cachedUsersCubit,
              )(),
              cachedUsersCubit: cachedUsersCubit,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
