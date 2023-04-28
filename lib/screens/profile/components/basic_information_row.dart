import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

import '../../../messenger/functions/size_config.dart';

class BasicInfoRow extends StatelessWidget {
  final String title;
  final String value;
  const BasicInfoRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBasicInfoRow(context);
  }

  Widget getBasicInfoRow(context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: FontStyles.rubikP3Medium(color: Palette.textBlack50),
            ),
            Text(
              value,
              style: FontStyles.rubikP1(color: Palette.textBlack),
            ),
          ],
        ),
      ),
    );
  }
}
