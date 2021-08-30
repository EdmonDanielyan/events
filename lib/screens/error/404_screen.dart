import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/error/components/body.dart';
import 'package:ink_mobile/components/bottom_nav_bars/ink_bottom_navigation_bar.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: InkBottomNavBar(selectedItemCode: InkBottomNavBarItemCodes.main)
    );
  }
}
