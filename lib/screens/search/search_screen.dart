import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/constants/app_metrics_events.dart';
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
    AppMetricsEvents().searchEvent();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: InkAppBar(
        context,
        leading: const SizedBox.shrink(),
        showPersonalPageLink: true,
          title: "Поиск по порталу",
      ),
      body: Body(
        searchCubit: widget.searchCubit,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
