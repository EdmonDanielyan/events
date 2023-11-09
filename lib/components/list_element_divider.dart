import 'package:flutter/material.dart';

class ListElementDivider extends StatelessWidget {
  const ListElementDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 40,
      thickness: 1.0,
      color: Color(0xffe5e5e5),
    );
  }
}
