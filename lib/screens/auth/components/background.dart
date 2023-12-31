import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.9,
        padding: const EdgeInsets.all(20),
        child: Stack(children: [
          Container(
            alignment: Alignment.topLeft,
            width: size.width,
            decoration: const BoxDecoration(color: Color(0xFFF9F9F9)),
            child: child,
          )
        ]));
  }
}
