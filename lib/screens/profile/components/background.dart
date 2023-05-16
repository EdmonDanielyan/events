import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Color? color;
  const Background({Key? key, required this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      height: size.height,
      width: size.width,
      child: child,
      decoration: BoxDecoration(color: color ?? Color(0xFFF9F9F9)),
    );
  }
}
