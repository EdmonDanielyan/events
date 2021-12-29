import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_mixin.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';

class AppLayerScreen extends StatefulWidget {
  final NewBottomNavBarCubit newBottomNavBarCubit;
  const AppLayerScreen({Key? key, required this.newBottomNavBarCubit})
      : super(key: key);

  @override
  State<AppLayerScreen> createState() => _AppLayerScreenState();
}

class _AppLayerScreenState extends State<AppLayerScreen>
    with NewBottomNavBarMixin {
  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = getScreens();

    return Scaffold(
      body: PageView(
        controller: widget.newBottomNavBarCubit.pageController,
        children: _screens,
        onPageChanged: widget.newBottomNavBarCubit.onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
