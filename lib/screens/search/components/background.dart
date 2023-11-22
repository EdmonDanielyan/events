import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/palette.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(color: Palette.white),
      child: SingleChildScrollView(child: child),
    );
  }
}
