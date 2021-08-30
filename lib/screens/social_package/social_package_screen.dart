import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/bottom_nav_bars/ink_bottom_navigation_bar.dart';
import 'package:ink_mobile/screens/social_package/components/body.dart';

class SocialPackageScreen extends StatelessWidget {
  const SocialPackageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(title: 'Социальный пакет'),
      body: Body(),
      bottomNavigationBar: InkBottomNavBar(selectedItemCode: InkBottomNavBarItemCodes.services),
    );
  }
}
