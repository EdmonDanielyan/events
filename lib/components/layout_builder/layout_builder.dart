import 'package:flutter/material.dart';

import '../../messenger/functions/size_config.dart';

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
        return builder(
          context,
          constraints,
          SizeConfig(context, constraints.maxWidth).isTablet,
        );
      },
    );
  }
}
