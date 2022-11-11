import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class FilterSliderElement extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  const FilterSliderElement({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
    this.selectedColor = Colors.green,
    this.unselectedColor = Colors.white,
    this.selectedTextStyle,
    this.unselectedTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: isSelected
            ? TextStyle(
                color: Colors.white,
                fontSize:
                    SizeConfig(context, 13.0).getProportionateScreenHeight,
              )
            : TextStyle(
                color: Colors.black,
                fontSize:
                    SizeConfig(context, 13.0).getProportionateScreenHeight,
              ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected ? selectedColor : unselectedColor,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 8)),
      ),
    );
  }
}
