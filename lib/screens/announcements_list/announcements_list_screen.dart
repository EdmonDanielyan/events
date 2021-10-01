import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/announcements_list/announcements_list_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/announcements_list/components/body.dart';

class AnnouncementsListScreen extends StatelessWidget {
  const AnnouncementsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return BlocProvider<AnnouncementsListCubit>(
        create: (BuildContext context) =>
            AnnouncementsListCubit(languageStrings: _strings),
        child: Scaffold(
          appBar: InkAppBarWithText(title: _strings.announcements),
          body: Body(),
          bottomNavigationBar: NewBottomNavBar(),
        ));
  }
}
