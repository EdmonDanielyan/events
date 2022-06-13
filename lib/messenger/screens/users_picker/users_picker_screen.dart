import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/components/bottom_sheet/bottom_sheet.dart';
import 'package:ink_mobile/messenger/components/textfield/search_field.dart';
import 'package:ink_mobile/messenger/cubits/cached/chat_users_picker/chat_users_picker_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/chat_users_picker/chat_users_picker_state.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/string_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/users_cubit.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/users_picker/user_picker_card.dart';
import 'package:ink_mobile/setup.dart';

import 'users_list.dart';

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
  late final StringCubit titleCubit;
  late final StringCubit submitTxtCubit;

  UsersCubit selectedUsers = UsersCubit();
  final chatUsersPickerCubit = getIt<ChatUsersPickerCubit>();

  @override
  void initState() {
    super.initState();

    titleCubit = widget.titleCubit ?? StringCubit("");
    submitTxtCubit = widget.submitTxtCubit ?? StringCubit("");
  }

  void _onSelect(User user, bool enabled) {
    if (enabled) {
      selectedUsers.add(user);
    } else {
      selectedUsers.remove(user);
    }
    if (widget.onChange != null) {
      widget.onChange!(selectedUsers.users);
    }
  }

  void _onSubmit(BuildContext context) {
    if (widget.onSubmit != null) {
      widget.onSubmit!(context, selectedUsers.users);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StringCubit, String>(
      bloc: submitTxtCubit,
      builder: (context, submitState) {
        return BlocBuilder<StringCubit, String>(
          bloc: titleCubit,
          builder: (context, titleState) {
            return CustomBottomSheetChild(
              constraints: BoxConstraints(
                minHeight: 250.0,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              title: titleState,
              cancelBtnTxt: "Отмена",
              submitBtnTxt: submitState,
              onSubmit: _onSubmit,
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 13.0),
                            child: SearchField(
                              hint: "Поиск",
                              onChanged: (str) => chatUsersPickerCubit.onSearch(
                                  str, widget.chat),
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          BlocBuilder<UsersCubit, List<User>>(
                            bloc: selectedUsers,
                            builder: (context, usersState) {
                              if (usersState.isNotEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: UsersPickerList(users: usersState),
                                );
                              }

                              return const SizedBox();
                            },
                          ),
                          BlocBuilder<ChatUsersPickerCubit,
                              ChatUsersPickerState>(
                            bloc: chatUsersPickerCubit,
                            builder: (context, state) {
                              List<User> users = widget.chat != null
                                  ? chatUsersPickerCubit
                                      .getExceptParticipants(widget.chat!)
                                  : state.users;

                              return ListView.builder(
                                itemCount: users.length,
                                shrinkWrap: true,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemBuilder: (context, index) {
                                  return UserPickerCard(
                                    users[index],
                                    onSelect: _onSelect,
                                    onlineCubit: widget.onlineCubit,
                                    cachedChatsCubit: widget.cachedChatsCubit,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
