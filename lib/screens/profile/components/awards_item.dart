import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/models/user_data.dart';

class Award extends StatelessWidget {
  final UserBadges award;
  const Award({Key? key, required this.award}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getWidgetByExtension(context);
  }

  Widget getWidgetByExtension(BuildContext context) {
    int dotPosition = award.icon.lastIndexOf('.');
    String extension = award.icon.substring(dotPosition);
    bool isSvg = extension == '.svg';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isSvg) SvgPicture.network(award.icon, width: 64.0, height: 64.0),
        if (!isSvg)
          Image.network(
            award.icon,
            width: 64.0,
            height: 64.0,
          ),
        Text(award.count.toString() == "null" ? "" : award.count.toString()),
      ],
    );
  }
}
