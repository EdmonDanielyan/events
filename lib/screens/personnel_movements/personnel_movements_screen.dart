import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/bottom_nav_bars/ink_bottom_navigation_bar.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_cubit.dart';
import 'package:ink_mobile/screens/personnel_movements/components/body.dart';

class PersonnelMovementsScreen extends StatelessWidget {
  const PersonnelMovementsScreen({Key? key}) : super(key: key);
  static const String TITLE = 'Кадровые перемещения';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonnelMovementsCubit>(
      create: (BuildContext context) => PersonnelMovementsCubit(),
      child: Scaffold(
        appBar: InkAppBarWithText(
            title: TITLE
        ),
        body: Body(),
        bottomNavigationBar: InkBottomNavBar(
            selectedItemCode: InkBottomNavBarItemCodes.services
        ),
      )
    );
  }
}
