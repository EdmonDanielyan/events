import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_cubit.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_other_days_element.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_today_element.dart';
import 'package:ink_mobile/screens/birthdays/components/birthdays_listview_builder.dart';
import 'package:ink_mobile/setup.dart';

import '../../messenger/functions/size_config.dart';

class BirthdaysScreen extends StatefulWidget {
  const BirthdaysScreen({Key? key}) : super(key: key);

  @override
  State<BirthdaysScreen> createState() => _BirthdaysScreenState();
}

class _BirthdaysScreenState extends State<BirthdaysScreen> {
  final uiCubit = getIt<BirthdaysCubit>();

  void _setUsersToCache(BirthdaysState state) {
    List<User> users = [];
    if (state.birthdaysOther != null) {
      final _others = _birthdaysToUsers(state.birthdaysOther!);
      users.addAll(_others);
    }

    if (state.birthdaysToday != null) {
      final _today = _birthdaysToUsers(state.birthdaysToday!);
      users.addAll(_today);
    }

    getIt<CachedUsersCubit>().addUsers(users);
  }

  List<User> _birthdaysToUsers(List<BirthdayData> birthdays) {
    return birthdays
        .map((e) =>
            User(id: e.id, name: e.name ?? "", avatarUrl: e.pathToAvatar ?? ""))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    uiCubit.load();
  }

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return Scaffold(
      backgroundColor: Palette.white,
      appBar: InkAppBarWithText(
        context,
        title: _strings.birthdays,
      ),
      body: BlocConsumer<BirthdaysCubit, BirthdaysState>(
        listener: (context, state) {
          if (state.type == BirthdaysStateType.LOADED) {
            _setUsersToCache(state);
          }
        },
        bloc: uiCubit,
        builder: (context, state) {
          switch (state.type) {
            case (BirthdaysStateType.EMPTY):
              {
                return Center(
                  child: Text(
                    _strings.noBirthdaysSoon,
                    style: TextStyle(
                      fontSize: SizeConfig(context, 12.0)
                          .getProportionateScreenHeight,
                    ),
                  ),
                );
              }

            case (BirthdaysStateType.LOADED):
              {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32.0,
                    horizontal: 20.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* Дни рождения сегодня*/
                        state.birthdaysToday!.length > 0
                            ? BirthdaysListViewBuilder(
                                title: RichText(
                                  text: TextSpan(
                                    style: FontStyles.rubikH4(),
                                    children: [
                                      TextSpan(
                                        text: _strings.congratulate_people,
                                        style: FontStyles.rubikH4(
                                            color: Palette.textBlack),
                                      ),
                                      TextSpan(
                                        text: _strings.birthday_people,
                                        style: FontStyles.rubikH4(
                                            color: Palette.blue9CF),
                                      ),
                                    ],
                                  ),
                                ),
                                itemCount: state.birthdaysToday!.length,
                                itemBuilder: (index) {
                                  return BirthdayTodayElement(
                                    index: index,
                                    birthday: state.birthdaysToday![index],
                                  );
                                },
                                divider: Divider(
                                  thickness: 1,
                                  height: 64.0,
                                ),
                              )
                            : const SizedBox.shrink(),
                        /* Дни рождения в ближайшие дни*/
                        if (uiCubit.hasBirthdaysSoon) ...[
                          Text(
                            _strings.inComingDays,
                            style: FontStyles.rubikH4(color: Palette.textBlack),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          if (state.firstDayBirthdays?.isNotEmpty == true)
                            soonBirthdaysList(
                              birthdays: state.firstDayBirthdays!,
                              needDivider: true,
                            ),
                          if (state.secondDayBirthdays?.isNotEmpty == true)
                            soonBirthdaysList(
                              birthdays: state.secondDayBirthdays!,
                              needDivider: true,
                            ),
                          if (state.thirdDayBirthdays?.isNotEmpty == true)
                            soonBirthdaysList(
                              birthdays: state.thirdDayBirthdays!,
                              needDivider: false,
                            ),
                        ],
                      ],
                    ),
                  ),
                );
              }

            case (BirthdaysStateType.LOADING):
              {
                return InkPageLoader();
              }

            case (BirthdaysStateType.ERROR):
              {
                return ErrorRefreshButton(
                  onTap: () => uiCubit.load(),
                  text: state.errorMessage!,
                );
              }
          }
        },
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }

  Widget soonBirthdaysList(
      {required List<BirthdayData> birthdays, required bool needDivider}) {
    return BirthdaysListViewBuilder(
      title: Text(
        birthdays.first.birthdayString ?? "",
        style: FontStyles.rubikP1Medium(color: Palette.greenE4A),
      ),
      itemCount: birthdays.length,
      itemBuilder: (index) {
        return BirthdayOtherDaysElement(
          birthday: birthdays[index],
        );
      },
      divider: needDivider
          ? Divider(
              thickness: 1,
              height: 48.0,
            )
          : const SizedBox.shrink(),
    );
  }
}
