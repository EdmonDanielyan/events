import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_mixin.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';

class AppLayerScreen extends StatelessWidget {
  const AppLayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayerWidget();
  }
}

class LayerWidget extends StatelessWidget with NewBottomNavBarMixin {
  const LayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = BlocProvider.of<NewBottomNavBarCubit>(context);
    List<Widget> _screens = getScreens();

    return Scaffold(
      body: PageView(
        controller: _cubit.pageController,
        children: _screens,
        onPageChanged: _cubit.onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: NewBottomNavBar(),
    );
  }
}
