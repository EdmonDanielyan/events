import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class FilterSliderElement extends StatelessWidget {
  final String title;
  final Function onTap;
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
    final buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: const Color.fromARGB(255, 13, 133, 17)),
      )),
      backgroundColor: MaterialStateProperty.all(Color(0xFFFAFAFA)),
    );

    return TextButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
          style: isSelected
              ? selectedTextStyle
              : (unselectedTextStyle ??
                  TextStyle(
                    color: const Color.fromARGB(255, 13, 133, 17),
                    fontSize:
                        SizeConfig(context, 13.0).getProportionateScreenHeight,
                  )),
        ),
        style: isSelected ? buttonStyle : buttonStyle);
  }
}
