import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: size.width,
            child: child,
            decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
          )
        ],
      ),
    );
  }
}
