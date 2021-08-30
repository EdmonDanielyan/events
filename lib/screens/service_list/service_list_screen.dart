import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/bottom_nav_bars/ink_bottom_navigation_bar.dart';
import 'package:ink_mobile/screens/service_list/components/body.dart';

class ServiceListScreen extends StatelessWidget {
  const ServiceListScreen({Key? key}) : super(key: key);
  static const String TITLE = 'Сервисы';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(title: TITLE),
      body: Body(),
      backgroundColor: Color(0xfff9f9f9),
      bottomNavigationBar: InkBottomNavBar(
          selectedItemCode: InkBottomNavBarItemCodes.services
      ),
    );
  }
}
