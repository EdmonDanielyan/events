import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/references/references_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'components/body.dart';

class ReferencesScreen extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  const ReferencesScreen({Key? key, this.appBar}) : super(key: key);

  @override
  _ReferencesScreenState createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return Scaffold(
      appBar: widget.appBar ?? InkAppBarWithText(title: _strings.orderInquiry),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 25),
              child: Text(
                _strings.orderInquiry,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            BlocProvider<ReferencesPageCubit>(
              create: (BuildContext context) =>
                  ReferencesPageCubit(languageStrings: _strings),
              child: Body(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
