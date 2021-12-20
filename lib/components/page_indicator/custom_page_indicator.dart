import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  const CustomPageIndicator(
      {Key? key, required this.controller, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      axisDirection: Axis.horizontal,
      effect: JumpingDotEffect(
        dotHeight: 3.0,
        dotWidth: 40.0,
        dotColor: Colors.grey,
        strokeWidth: 1.0,
        activeDotColor: Color(0xff2c4155),
        paintStyle: PaintingStyle.fill,
        spacing: 0.0,
      ),
    );
  }
}
