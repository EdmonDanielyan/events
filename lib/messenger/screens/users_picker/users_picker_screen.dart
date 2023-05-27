import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/string_cubit.dart';
import 'package:ink_mobile/messenger/handler/create_chat.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/users_picker/body.dart';
import 'package:ink_mobile/setup.dart';

class UsersPickerScreen extends StatefulWidget {
  final StringCubit? titleCubit;
  final StringCubit? submitTxtCubit;
  final void Function(BuildContext, List<User>)? onSubmit;
  final void Function(List<User>)? onChange;
  final OnlineCubit onlineCubit;
  final CachedChatsCubit cachedChatsCubit;
  final Chat? chat;
  const UsersPickerScreen({
    Key? key,
    this.titleCubit,
    this.submitTxtCubit,
    this.onSubmit,
    this.onChange,
    required this.onlineCubit,
    required this.cachedChatsCubit,
    this.chat,
  }) : super(key: key);

  @override
  _UsersPickerScreenState createState() => _UsersPickerScreenState();
}

class _UsersPickerScreenState extends State<UsersPickerScreen> {
  CachedChatsCubit get chatsCubit => widget.cachedChatsCubit;
  OnlineCubit get onlineCubit => widget.onlineCubit;
  final cachedUsersCubit = getIt<CachedUsersCubit>();
  final createChat = StringCubit("Написать");

  void _createChat(List<User> users, BuildContext context) {
    CreateChatHandler(
      users,
      context,
      chatsCubit: chatsCubit,
      onlineCubit: onlineCubit,
      cachedUsersCubit: cachedUsersCubit,
    ).call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(
        context,
        title: "Выбор собеседников",
      ),
      body: Body(
        submitTxtCubit: widget.submitTxtCubit ?? createChat,
        onChange: (users) {
          if (widget.onChange != null) {
            widget.onChange!(users);
          } else {
            widget.submitTxtCubit?.setNew(
              users.length > 1 ? "Создать группу" : "Написать",
            );
            createChat.setNew(
              users.length > 1 ? "Создать группу" : "Написать",
            );
          }
        },
        onSubmit: (_context, users) {
          if (widget.onSubmit != null) {
            widget.onSubmit!(_context, users);
          } else {
            Navigator.of(_context).pop();
            _createChat(users, _context);
          }
        },
        onlineCubit: onlineCubit,
        cachedChatsCubit: chatsCubit,
      ),
    );
  }
}
