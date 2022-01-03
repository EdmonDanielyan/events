import 'package:flutter/material.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  final PackageInfoProvider packageInfoProvider;
  const WelcomeScreen({Key? key, required this.packageInfoProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        packageInfo: packageInfoProvider,
      ),
    );
  }
}
