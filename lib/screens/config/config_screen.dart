import 'package:flutter/material.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/config/components/body.dart';

import '../../components/app_bars/ink_app_bar_with_text.dart';

class ConfigScreen extends StatefulWidget {
  final PackageInfoProvider packageInfoProvider;

  final String env;

  const ConfigScreen(
      {Key? key, required this.packageInfoProvider, required this.env})
      : super(key: key);

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(
        context,
        title: "Настройки приложения",
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            toggleableActiveColor: Colors.white,
            unselectedWidgetColor: Colors.white,
            textTheme: TextTheme(
              subtitle1: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: Colors.white,
              ),
            ),
            iconTheme: IconThemeData(color: Colors.white)),
        child: Body(
          packageInfo: widget.packageInfoProvider,
          env: widget.env,
        ),
      ),
    );
  }
}
