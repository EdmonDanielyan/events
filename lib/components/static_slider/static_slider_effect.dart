import 'package:flutter/material.dart';
import 'package:ink_mobile/components/static_slider/static_slider_painer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/src/effects/indicator_effect.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/src/painters/indicator_painter.dart';

class StaticSliderEffect extends IndicatorEffect {
  final double activeDotHeight;
  final double activeDotRadius;
  final double rowWidth;

  const StaticSliderEffect({
    this.activeDotHeight = 4.0,
    this.activeDotRadius = 2.0,
    required this.rowWidth,
    double? offset,
    double dotWidth = 217,
    double dotHeight = 2.0,
    double spacing = 0,
    double radius = 0,
    Color dotColor = Colors.grey,
    Color activeDotColor = Colors.indigo,
    double strokeWidth = 1.0,
    PaintingStyle paintStyle = PaintingStyle.fill,
  }) : super(
          dotWidth: dotWidth,
          dotHeight: dotHeight,
          spacing: spacing,
          radius: radius,
          strokeWidth: strokeWidth,
          paintStyle: paintStyle,
          dotColor: dotColor,
          activeDotColor: activeDotColor,
        );

  get actDotRadius => Radius.circular(activeDotRadius);

  @override
  IndicatorPainter buildPainter(int count, double offset) {
    return StaticSliderPainter(count: count, offset: offset, effect: this);
  }
}
