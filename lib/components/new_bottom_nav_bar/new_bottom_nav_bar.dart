import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_mixin.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/setup.dart';

import '../../messenger/functions/size_config.dart';
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
      iconHeight: SizeConfig(context, 21.0).getProportionateScreenHeight,
      activeIconHeight: SizeConfig(context, 21.0).getProportionateScreenHeight,
    );
    return BlocBuilder<NewBottomNavBarCubit, int>(
      bloc: _cubit,
      builder: (BuildContext context, int currentIndex) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor:
              widget.showActive ? Color(0xff12512a) : Colors.grey,
          unselectedItemColor: Colors.grey,
          selectedFontSize:
              SizeConfig(context, 10.0).getProportionateScreenHeight,
          unselectedFontSize:
              SizeConfig(context, 10.0).getProportionateScreenHeight,
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
