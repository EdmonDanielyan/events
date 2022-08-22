import 'package:flutter/material.dart';

import '../../messenger/functions/size_config.dart';

class ElevatedFullWidthButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const ElevatedFullWidthButton(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3.0),
        width: size.width,
        height: SizeConfig(context, 44.0).getProportionateScreenHeight,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Color(0xfff2f2f2),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 0, style: BorderStyle.none),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(1, 4))
            ],
          ),
          child: ElevatedButton(
              onPressed: () {
                onTap();
              },
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize:
                        SizeConfig(context, 18.0).getProportionateScreenHeight,
                  ),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xfff2f2f2)),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero))),
        ));
  }
}
