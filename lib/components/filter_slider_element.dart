import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class FilterSliderElement extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final TextStyle selectedTextStyle;
  final TextStyle? unselectedTextStyle;

  const FilterSliderElement({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
    this.selectedColor = Colors.green,
    this.unselectedColor = Colors.white,
    this.selectedTextStyle = const TextStyle(
      color: Colors.white,
    ),
    this.unselectedTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Palette.transparent,
        borderRadius: BorderRadius.all(Radius.circular(65)),
        border: Border.all(
          color: Palette.greenE4A,
        )
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Text(
            title,
            style: FontStyles.rubikP2(color: Palette.greenE4A),
          ),
        ),
      ),
    );
  }
}
