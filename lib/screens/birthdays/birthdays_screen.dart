import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_cubit.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_other_days_element.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_today_element.dart';

class BirthdaysScreen extends StatelessWidget {
  final BirthdaysCubit birthdaysCubit;
  const BirthdaysScreen({Key? key, required this.birthdaysCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return Scaffold(
      appBar: InkAppBarWithText(
        title: _strings.birthdays,
      ),
      body: BlocBuilder<BirthdaysCubit, BirthdaysState>(
        bloc: birthdaysCubit,
        builder: (context, state) {
          switch (state.type) {
            case (BirthdaysStateType.EMPTY):
              {
                return Center(child: Text(_strings.noBirthdaysSoon));
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
                                child: Text(_strings.birthdays,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              flex: 2,
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
                                  Container(
                                    margin: EdgeInsets.only(left: 25),
                                    child: Text(_strings.today.toUpperCase(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
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
                                  Container(
                                    margin: EdgeInsets.only(left: 25),
                                    child: Text(
                                        _strings.inComingDays.toUpperCase(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
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
      bottomNavigationBar: NewBottomNavBar(),
    );
  }

  List<Widget> _getBirthdaysToday(
      BuildContext context, List<BirthdayData>? birthdaysData) {
    List<Widget> birthdays = [];

    birthdaysData?.forEach((birthday) {
      birthdays.add(BirthdayTodayElement(birthday: birthday));

      birthdays.add(Divider(
        thickness: 1,
        height: 4,
      ));
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
