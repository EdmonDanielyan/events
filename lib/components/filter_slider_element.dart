import 'package:flutter/material.dart';

class FilterSliderElement extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;

  const FilterSliderElement(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isSelected = false,
      this.selectedColor = Colors.green,
      this.unselectedColor = Colors.white,
      this.selectedTextStyle = const TextStyle(color: Colors.white),
      this.unselectedTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(1, 4))
          ],
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          child: Text(
            title,
            style: isSelected ? selectedTextStyle : unselectedTextStyle,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                isSelected ? selectedColor : unselectedColor),
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 8)),
          )),
    ));
  }
}
