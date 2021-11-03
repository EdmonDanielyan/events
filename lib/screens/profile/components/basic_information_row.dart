import 'package:flutter/material.dart';

class BasicInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const BasicInfoRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBasicInfoRow(context);
  }

  Widget getBasicInfoRow(context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade400, width: 0.5),
            bottom: BorderSide(color: Colors.grey.shade400, width: 0.5),
          )),
      width: size.width,
      child: Padding(
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 14),
                ),
                Text(
                  value,
                  style: TextStyle(color: Color(0xFF1D2126), fontSize: 16),
                )
              ],
            ),
          )),
    );
  }
}
