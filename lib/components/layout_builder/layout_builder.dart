import 'package:flutter/material.dart';

class CustomLayoutBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
    bool isTablet,
  ) builder;
  const CustomLayoutBuilder({Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        bool isTablet = constraints.maxWidth > 700;
        return builder(
          context,
          constraints,
          isTablet,
        );
      },
    );
  }
}
