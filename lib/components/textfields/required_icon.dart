import 'package:flutter/material.dart';

class RequiredTextfieldIcon extends StatelessWidget {
  const RequiredTextfieldIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 10),
      child: Text("*",
          style: TextStyle(color: Colors.red), textAlign: TextAlign.center),
    );
  }
}
