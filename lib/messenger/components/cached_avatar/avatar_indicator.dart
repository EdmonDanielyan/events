import 'package:flutter/material.dart';

class AvatarIndicator extends StatelessWidget {
  final double indicatorSize;
  const AvatarIndicator({Key? key, this.indicatorSize = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: const EdgeInsets.all(2.0),
      child: Icon(
        Icons.circle,
        color: Colors.green[800],
        size: indicatorSize,
      ),
    );
  }
}
