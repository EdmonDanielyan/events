import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/screens/search/components/body.dart';
import 'package:ink_mobile/components/bottom_nav_bars/ink_bottom_navigation_bar.dart';
import 'package:ink_mobile/cubit/search/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
        create: (BuildContext context) => SearchCubit(),
        child: Scaffold(
            body: Body(),
            bottomNavigationBar: InkBottomNavBar(
                selectedItemCode: InkBottomNavBarItemCodes.search
            )
        )
    );
  }
}
