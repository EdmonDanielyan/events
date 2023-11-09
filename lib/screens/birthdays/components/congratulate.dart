import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';

import '../../../messenger/functions/size_config.dart';

class BirthdayCongratulate extends StatelessWidget {
  final void Function()? onTap;
  final double? height;
  final double? width;
  const BirthdayCongratulate({
    Key? key,
    this.onTap,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? SizeConfig(context, 55).getProportionateScreenHeight,
        width: width ?? SizeConfig(context, 55).getProportionateScreenHeight,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Palette.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: Palette.greenE4A),
        ),
        child: SvgPicture.asset(
          IconLinks.GIFT_ICON,
          color: Palette.greenE4A,
        ),
      ),
    );
  }
}
