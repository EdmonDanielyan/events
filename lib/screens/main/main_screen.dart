import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/components/bottom_nav_bars/ink_bottom_navigation_bar.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/screens/main/components/body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainPageCubit>(
        create: (BuildContext context) => MainPageCubit(),
        child: Container(
          child: Scaffold(
            appBar: InkAppBar(showPersonalPageLink: true),
            body: Body(),
            bottomNavigationBar: InkBottomNavBar(selectedItemCode: InkBottomNavBarItemCodes.main),
          ),
        )
    );
  }
}
