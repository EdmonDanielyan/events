import 'package:flutter/material.dart';

class BirthdaysListViewBuilder extends StatelessWidget {
  final Widget? title;
  final itemCount;
  final Widget Function(int) itemBuilder;
  final Widget divider;
  const BirthdaysListViewBuilder({
    Key? key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    required this.divider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) title!,
        const SizedBox(height: 16.0),
        ListView.builder(
          shrinkWrap: true,
          controller: ScrollController(keepScrollOffset: false),
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemBuilder(index),
                index == (itemCount - 1)
                    ? divider
                    : const SizedBox(height: 16.0)
              ],
            );
          },
        )
      ],
    );
  }
}
