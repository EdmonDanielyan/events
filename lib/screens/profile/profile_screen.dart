import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/profile/components/body.dart';
import 'package:ink_mobile/components/bottom_nav_bars/ink_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (BuildContext context) => ProfileCubit(),
      child: Scaffold(
        body: Body(),
        bottomNavigationBar: InkBottomNavBar(
            selectedItemCode: InkBottomNavBarItemCodes.main
        )
      )
    );
  }
}
