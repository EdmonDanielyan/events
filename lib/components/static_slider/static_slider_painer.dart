import 'package:flutter/material.dart';
import 'package:ink_mobile/components/static_slider/static_slider_effect.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/src/painters/indicator_painter.dart';

class StaticSliderPainter extends IndicatorPainter {
  final StaticSliderEffect effect;

  StaticSliderPainter({
    required this.effect,
    required int count,
    required double offset,
  }) : super(offset, count, effect);

  @override
  void paint(Canvas canvas, Size size) {
//    super.paint(canvas, size);
    // paint still dots
    paintStillDots(canvas, size);
    Paint paintObj = new Paint();
    final activeDotPaint = paintObj..color = effect.activeDotColor;
    final staticSlider = _calcBounds(size, offset);
    canvas.drawRRect(staticSlider, activeDotPaint);
  }

  @override
  void paintStillDots(Canvas canvas, Size size) {
    final xPos = (size.width / 2) - (effect.dotWidth / 2);
    final yPos = size.height / 2;
    final bounds = Rect.fromLTRB(xPos, yPos - effect.dotHeight / 2,
        xPos + effect.dotWidth, yPos + effect.dotHeight / 2);
    var rect = RRect.fromRectAndRadius(bounds, dotRadius);
    canvas.drawRRect(rect, dotPaint);
  }

  RRect _calcBounds(Size size, num i) {
    double lineWidth = effect.dotWidth;
    double screenWidth = size.width;
    double activeDotWidth = lineWidth * screenWidth / effect.rowWidth;

    final xPos =
        ((size.width / 2) - (effect.dotWidth / 2)) + (i * activeDotWidth);
    final yPos = size.height / 2;

    double left = xPos;
    double right = xPos + activeDotWidth;

    return RRect.fromLTRBR(
      left,
      yPos - effect.activeDotHeight / 2,
      right,
      yPos + effect.activeDotHeight / 2,
      effect.actDotRadius,
    );
  }
}
