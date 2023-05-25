import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class ChatInfoBtn extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? color;
  final EdgeInsets? padding;
  const ChatInfoBtn({
    Key? key,
    required this.title,
    this.onTap,
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SvgPicture.asset(
              IconLinks.FIRE_ICON,
              height: 24.0,
              width: 24.0,
              color: Palette.redF1C,
            ),
            const SizedBox(width: 12.0),
            Text(
              title,
              style: FontStyles.rubikP1(color: Palette.redF1C),
            ),
          ],
        ),
      ),
    );
  }
}
