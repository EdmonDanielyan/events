import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/open_university/open_university_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/open_university/components/body.dart';

class OpenUniversityScreen extends StatelessWidget {
  const OpenUniversityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return BlocProvider<OpenUniversityCubit>(
        create: (BuildContext context) => OpenUniversityCubit(),
        child: Scaffold(
          appBar: InkAppBarWithText(title: _strings.openUniversity),
          body: Body(),
          bottomNavigationBar: NewBottomNavBar(),
        ));
  }
}
