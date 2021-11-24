import 'package:flutter/material.dart';

class CentringWrapper extends StatelessWidget {
  const CentringWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.65,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(flex: 1, child: child),
        ]));
  }
}
