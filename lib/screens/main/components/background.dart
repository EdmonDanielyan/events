import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColoredBox(
        color: const Color(0xFFF9F9F9),
        child: child,
      ),
    );
  }
}
