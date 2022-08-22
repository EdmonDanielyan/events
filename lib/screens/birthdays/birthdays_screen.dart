import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_cubit.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_other_days_element.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_today_element.dart';
import 'package:ink_mobile/setup.dart';

import '../../messenger/functions/size_config.dart';
import 'components/birthday_title.dart';

class BirthdaysScreen extends StatelessWidget {
  final BirthdaysCubit birthdaysCubit;
  const BirthdaysScreen({Key? key, required this.birthdaysCubit})
      : super(key: key);

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
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return Scaffold(
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
        bloc: birthdaysCubit,
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
                List<Widget> bdaysToday =
                    _getBirthdaysToday(context, state.birthdaysToday!);
                List<Widget> bdaysOther =
                    _getBirthdaysOther(context, state.birthdaysOther!);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom:
                                BorderSide(width: 1, color: Color(0xFFE5E5E5)),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 8,
                                child: Text(
                                  _strings.birthdays,
                                  style: TextStyle(
                                    fontSize: SizeConfig(context, 24.0)
                                        .getProportionateScreenHeight,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Image.asset("assets/images/balloon.png"),
                            )
                          ],
                        ),
                      ),
                      /* Дни рождения сегодня*/
                      state.birthdaysToday!.length > 0
                          ? Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BirthdayTitle(_strings.today.toUpperCase()),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: Color(0xFFE5E5E5)),
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xFFE5E5E5)),
                                        )),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      controller: ScrollController(
                                          keepScrollOffset: false),
                                      itemCount: bdaysToday.length,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              bdaysToday[index],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      /* Дни рождения в ближайшие дни*/
                      state.birthdaysOther!.length > 0
                          ? Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BirthdayTitle(
                                      _strings.inComingDays.toUpperCase()),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: Color(0xFFE5E5E5)),
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xFFE5E5E5)),
                                        )),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      controller: ScrollController(
                                          keepScrollOffset: false),
                                      itemCount: bdaysOther.length,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              bdaysOther[index],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
              }

            case (BirthdaysStateType.LOADING):
              {
                birthdaysCubit.load();
                return InkPageLoader();
              }

            case (BirthdaysStateType.ERROR):
              {
                return ErrorRefreshButton(
                  onTap: birthdaysCubit.refresh,
                  text: state.errorMessage!,
                );
              }
          }

          return Container();
        },
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }

  List<Widget> _getBirthdaysToday(
      BuildContext context, List<BirthdayData>? birthdaysData) {
    List<Widget> birthdays = [];

    int i = 0;

    birthdaysData?.forEach((birthday) {
      birthdays.add(BirthdayTodayElement(
        birthday: birthday,
        index: i,
      ));

      birthdays.add(Divider(
        thickness: 1,
        height: 4,
      ));
      i++;
    });

    if (birthdays.length > 0) birthdays.removeLast();

    return birthdays;
  }

  List<Widget> _getBirthdaysOther(
      BuildContext context, List<BirthdayData>? birthdaysData) {
    List<Widget> birthdays = [];

    birthdaysData?.forEach((birthday) {
      birthdays.add(BirthdayOtherDaysElement(birthday: birthday));

      birthdays.add(Divider(
        thickness: 1,
        height: 4,
      ));
    });

    if (birthdays.length > 0) birthdays.removeLast();

    return birthdays;
  }
}
