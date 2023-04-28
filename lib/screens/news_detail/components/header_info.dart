import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
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
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20.0,
          left: 20.0,
          top: 32.0,
          bottom: 16.0,
        ),
        child: Row(
          children: [
            Text(
              dateCreate != null
                  ? DateFormat('dd.MM.yyyy').format(dateCreate!)
                  : '',
              style: FontStyles.rubikP2(color: Palette.textBlack50),
            ),
            const Spacer(),
            SvgPicture.asset(
              IconLinks.OPENED_EYE_ICON_LINK,
              semanticsLabel: 'View Count',
              height: 16.0,
              width: 16.0,
              color: Palette.textBlack50,
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              viewCount.toString(),
              style: FontStyles.rubikP2(color: Palette.textBlack50),
            ),
          ],
        ),
      ),
    );
  }
}
