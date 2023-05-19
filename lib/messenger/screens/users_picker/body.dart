import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
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

import '../../../components/fields/search_field.dart';

class Body extends StatefulWidget {
  final OnlineCubit onlineCubit;
  final CachedChatsCubit cachedChatsCubit;
  final StringCubit? titleCubit;
  final StringCubit? submitTxtCubit;
  final void Function(BuildContext, List<User>)? onSubmit;
  final void Function(List<User>)? onChange;
  final Chat? chat;

  Body({
    Key? key,
    required this.onlineCubit,
    required this.cachedChatsCubit,
    this.titleCubit,
    this.submitTxtCubit,
    this.onSubmit,
    this.onChange,
    this.chat,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final StringCubit titleCubit;
  late final StringCubit submitTxtCubit;

  UsersCubit selectedUsers = UsersCubit();
  final chatUsersPickerCubit = getIt<ChatUsersPickerCubit>();

  @override
  void initState() {
    super.initState();

    titleCubit = widget.titleCubit ?? StringCubit("");
    submitTxtCubit = widget.submitTxtCubit ?? StringCubit("");

    chatUsersPickerCubit.onSearch("", widget.chat);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocBuilder<StringCubit, String>(
            bloc: submitTxtCubit,
            builder: (context, submitState) {
              return BlocBuilder<StringCubit, String>(
                bloc: titleCubit,
                builder: (context, titleState) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            const SizedBox(height: 16.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                              ),
                              child: SearchField(
                                hint: "Поиск",
                                onChanged: (str) => chatUsersPickerCubit
                                    .onSearch(str, widget.chat),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 32.0),
                              child: Text(
                                "Выберите собеседника или собеседников, если хотите создать групповой чат",
                                style: FontStyles.rubikP2(
                                    color: Palette.textBlack50),
                              ),
                            ),
                            BlocBuilder<ChatUsersPickerCubit,
                                ChatUsersPickerState>(
                              bloc: chatUsersPickerCubit,
                              builder: (context, state) {
                                List<User> users = widget.chat != null
                                    ? chatUsersPickerCubit
                                        .getExceptParticipants(widget.chat!)
                                    : state.users;

                                return ListView.separated(
                                  itemCount: users.length,
                                  shrinkWrap: true,
                                  controller:
                                      ScrollController(keepScrollOffset: false),
                                  itemBuilder: (context, index) {
                                    return BlocBuilder<UsersCubit, List<User>>(
                                      bloc: selectedUsers,
                                      builder: (context, usersState) {
                                        return UserPickerCard(
                                          users[index],
                                          enabled:
                                              usersState.contains(users[index]),
                                          onSelect: (User user, bool enabled) {
                                            enabled
                                                ? selectedUsers.add(user)
                                                : selectedUsers.remove(user);
                                            widget.onChange
                                                ?.call(selectedUsers.users);
                                          },
                                          onlineCubit: widget.onlineCubit,
                                          cachedChatsCubit:
                                              widget.cachedChatsCubit,
                                        );
                                      },
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      color: Palette.text5Grey,
                                      height: 32.0,
                                      thickness: 1.0,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 76.0,),
                    ],
                  );
                },
              );
            },
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Palette.white,
              height: 76.0,
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: BlocBuilder<UsersCubit, List<User>>(
                  bloc: selectedUsers,
                  builder: (context, usersState) {
                    bool usersSelected = usersState.isNotEmpty;
                    return DefaultButton(
                      enabled: usersSelected,
                      onTap: () => widget.onSubmit?.call(context, usersState),
                      title: "Написать",
                      buttonColor:
                          usersSelected ? Palette.greenE4A : Palette.text20Grey,
                      textColor:
                          usersSelected ? Palette.white : Palette.text20Grey,
                      suffixIcon: SvgPicture.asset(
                        IconLinks.EDIT_ICON,
                        height: 20.0,
                        width: 20.0,
                        color:
                            usersSelected ? Palette.white : Palette.text20Grey,
                      ),
                    );
                  },),
            ),
          ),
        )
      ],
    );
  }
}
