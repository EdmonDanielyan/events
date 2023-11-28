import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceHolderConstructor extends StatelessWidget {
  final double width;
  final double height;
  const PlaceHolderConstructor(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.5),
        highlightColor: Colors.grey.withOpacity(0.2),
        child: SizedBox(
          width: width,
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
          ),
        ));
  }
}
