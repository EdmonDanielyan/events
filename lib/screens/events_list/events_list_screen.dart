import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/bottom_nav_bars/ink_bottom_navigation_bar.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/screens/events_list/components/body.dart';

class EventsListScreen extends StatelessWidget {
  const EventsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsListCubit>(
        create: (BuildContext context) => EventsListCubit(),
        child: Scaffold(
          appBar: InkAppBarWithText(title: 'События'),
          body: Body(),
          bottomNavigationBar: InkBottomNavBar(selectedItemCode: InkBottomNavBarItemCodes.main),
        )
    );
  }
}
