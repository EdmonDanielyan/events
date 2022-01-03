import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_mixin.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/setup.dart';

import 'cubit/new_bottom_nav_bar_cubit.dart';

class NewBottomNavBar extends StatefulWidget {
  const NewBottomNavBar({Key? key}) : super(key: key);

  @override
  State<NewBottomNavBar> createState() => _NewBottomNavBarState();
}

class _NewBottomNavBarState extends State<NewBottomNavBar>
    with NewBottomNavBarMixin {
  final NewBottomNavBarCubit _cubit = sl<NewBottomNavBarCubit>();

  late final List<BottomNavigationBarItem> navBarItems;

  @override
  void initState() {
    super.initState();
    navBarItems = getItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBottomNavBarCubit, int>(
      builder: (BuildContext context, int currentIndex) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: const Color(0xff12512a),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12.0,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          items: navBarItems,
          onTap: (index) {
            TextFieldUtils.loseTextFieldFocus();
            navBottomNavBarItems[index]
                .onTap(context, _cubit.pageController.jumpToPage, index);
          },
        );
      },
    );
  }
}
