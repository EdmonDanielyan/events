import 'package:flutter/material.dart';

class GroupedContainer extends StatelessWidget {
  final List<Widget> children;
  const GroupedContainer({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
