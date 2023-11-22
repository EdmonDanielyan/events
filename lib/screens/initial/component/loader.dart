import 'package:flutter/material.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';

class InitScreenLoader extends StatelessWidget {
  const InitScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InkPageLoader(),
    );
  }
}
