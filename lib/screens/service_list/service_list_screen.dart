import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import 'components/body.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({Key? key}) : super(key: key);

  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _strings = localizationInstance;

    return Scaffold(
      appBar: InkAppBar(
        context,
        showPersonalPageLink: true,
        title: _strings.services,
      ),
      body: Body(),
      backgroundColor: Palette.white,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
