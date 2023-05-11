import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_mixin.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/setup.dart';

import 'cubit/new_bottom_nav_bar_cubit.dart';

class NewBottomNavBar extends StatefulWidget {
  final bool showActive;
  const NewBottomNavBar({Key? key, this.showActive = true}) : super(key: key);

  @override
  State<NewBottomNavBar> createState() => _NewBottomNavBarState();
}

class _NewBottomNavBarState extends State<NewBottomNavBar>
    with NewBottomNavBarMixin {
  final NewBottomNavBarCubit _cubit = getIt<NewBottomNavBarCubit>();

  List<BottomNavigationBarItem> navBarItems = [];

  @override
  Widget build(BuildContext context) {
    navBarItems = getItems(
      showActive: widget.showActive,
      iconHeight: 24.0,
      activeIconHeight: 24.0,
    );
    return BlocBuilder<NewBottomNavBarCubit, int>(
      bloc: _cubit,
      builder: (BuildContext context, int currentIndex) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor:
              widget.showActive ? Palette.greenE4A : Palette.textBlack50,
          unselectedItemColor: Palette.textBlack50,
          selectedLabelStyle: FontStyles.rubikP3(color: Palette.greenE4A),
          unselectedLabelStyle: FontStyles.rubikP3(color: Palette.textBlack50),
          iconSize: 24,
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
