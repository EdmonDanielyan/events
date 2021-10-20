import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/screens/main/components/body.dart';
import 'package:ink_mobile/setup.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<MainPageCubit>(
      create: (BuildContext context) => sl.get<MainPageCubit>(),
      child: Container(
        child: Scaffold(
          appBar: InkAppBar(showPersonalPageLink: true),
          body: Body(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
