import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/screens/search/components/body.dart';
import 'package:ink_mobile/cubit/search/search_cubit.dart';
import 'package:ink_mobile/setup.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<SearchCubit>(
      create: (BuildContext context) => sl.get<SearchCubit>(),
      child: Scaffold(
        body: Body(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
