import 'package:flutter/material.dart';

class SizeConfig {
  final BuildContext context;
  final double inputPx;
  const SizeConfig(this.context, this.inputPx);

  double get getProportionateScreenHeight {
    double screenHeight = MediaQuery.of(context).size.height;
    return (inputPx / 740.0) * screenHeight;
  }

  double get getProportionateScreenWidth {
    double screenWidth = MediaQuery.of(context).size.width;
    return (inputPx / 350.0) * screenWidth;
  }
}
