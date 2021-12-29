import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_mixin.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/setup.dart';

import 'cubit/new_bottom_nav_bar_cubit.dart';

class NewBottomNavBar extends StatelessWidget with NewBottomNavBarMixin {
  const NewBottomNavBar({Key? key}) : super(key: key);
  static NewBottomNavBarCubit _cubit = sl<NewBottomNavBarCubit>();

  @override
  Widget build(BuildContext context) {
    final _items = getItems();

    return BlocBuilder<NewBottomNavBarCubit, int>(
      builder: (BuildContext context, int currentIndex) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: const Color(0xff12512a),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12.0,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          items: _items,
          onTap: (index) {
            TextFieldUtils.loseTextFieldFocus();
            NewBottomNavBarMixin.navBottomNavBarItems[index]
                .onTap(context, _cubit.pageController.jumpToPage, index);
          },
        );
      },
    );
  }
}
