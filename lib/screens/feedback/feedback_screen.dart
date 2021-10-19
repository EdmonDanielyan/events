import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/feedback/components/body.dart';

class FeedBackScreen extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  const FeedBackScreen({Key? key, this.appBar, this.bottomNavigationBar})
      : super(key: key);

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return BlocProvider(
      create: (context) =>
          ScrollBottomLoadMoreCubit(ScrollBottomLoadMoreState(isOn: false)),
      child: Scaffold(
        appBar: widget.appBar ?? InkAppBarWithText(title: _strings.feedback),
        body: Body(),
        bottomNavigationBar: widget.bottomNavigationBar ?? NewBottomNavBar(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
