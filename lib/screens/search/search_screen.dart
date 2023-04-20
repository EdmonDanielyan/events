import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/search/components/body.dart';
import 'package:ink_mobile/cubit/search/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  final SearchCubit searchCubit;
  const SearchScreen({Key? key, required this.searchCubit}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    AppMetrica.reportEvent('вход пользователя в раздел «Поиск»');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Body(
        searchCubit: widget.searchCubit,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
