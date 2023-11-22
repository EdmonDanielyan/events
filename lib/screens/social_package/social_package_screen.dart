import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/social_package/components/body.dart';

class SocialPackageScreen extends StatelessWidget {
  const SocialPackageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBarWithText(
        context,
        title: _strings.socialPackage,
      ),
      body: const Body(),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
