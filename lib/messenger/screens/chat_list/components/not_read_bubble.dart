import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class NotReadBubbble extends StatelessWidget {
  final int count;
  const NotReadBubbble(this.count, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minWidth: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2.0),
        decoration: BoxDecoration(
          color: Palette.blue9CF,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 20.0,
        child: Center(
          child: Text(
            "$count",
            style: FontStyles.rubikP3Medium(color: Palette.white),
          ),
        ));
  }
}
