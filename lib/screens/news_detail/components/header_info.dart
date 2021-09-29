import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:intl/intl.dart';

class HeaderInfo extends StatelessWidget {
  final int viewCount;
  final DateTime? dateCreate;

  const HeaderInfo(
      {Key? key, required this.viewCount, required this.dateCreate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Container(
          child: Row(
            children: [
              Container(
                child: SvgPicture.asset(
                  IconLinks.VIEW_COUNT_SVG_LINK,
                  semanticsLabel: 'View Count',
                ),
                margin: EdgeInsets.only(right: 6.0),
              ),
              Container(
                  child: Text(viewCount.toString(),
                      style: TextStyle(
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  margin: EdgeInsets.only(right: 16.0)),
              Text(
                  dateCreate != null
                      ? DateFormat('dd.MM.yyyy').format(dateCreate!)
                      : '',
                  style: TextStyle(
                    fontFamily: "Helvetica",
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w200,
                  )),
            ],
          ),
          margin: EdgeInsets.only(left: 20.0, top: 17.0, bottom: 10.0),
        ));
  }
}
