import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/models/absence.dart';
import 'package:ink_mobile/utils/date_comparison_util.dart';

import '../constants/palette.dart';
import '../messenger/constants/enums.dart';
import 'cached_image/cached_avatar.dart';

class AvatarWithBadge extends StatelessWidget {
  AvatarWithBadge({
    Key? key,
    this.absence,
    this.birthday,
    required this.avatarHeight,
    required this.avatarWidth,
    this.onTap,
    this.name = "",
    this.url = "",
    this.indicator = false,
    this.padding,
  }) : super(key: key);

  final Absence? absence;
  final DateTime? birthday;
  final Function()? onTap;
  final String url;
  final String name;
  final double avatarHeight;
  final double avatarWidth;
  final bool indicator;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    ChatBadge chatBadge = ChatBadge.none;
    String iconLink = "";
    Color backgroundColor = Palette.white;
    if (absence != null) {
      chatBadge =
          absence!.isBusinessTrip ? ChatBadge.businessTrip : ChatBadge.vacation;
      iconLink =
          absence!.isBusinessTrip ? IconLinks.PLANE_ICON : IconLinks.SUN_ICON;
      backgroundColor =
          absence!.isBusinessTrip ? Palette.purple255 : Palette.yellow300;
    }
    if (birthday != null &&
        DateOnlyCompare().isSameDateWithoutYear(birthday!, DateTime.now())) {
      chatBadge = ChatBadge.birthday;
      iconLink = IconLinks.CAKE_ICON_LINK;
      backgroundColor = Palette.blue9CF;
    }

    return InkWell(
      onTap: onTap,
      child: Badge(
        isLabelVisible: chatBadge != ChatBadge.none,
        label: SvgPicture.asset(
          iconLink,
          color: Palette.white,
          height: 12.0,
          width: 12.0,
        ),
        backgroundColor: backgroundColor,
        smallSize: 20.0,
        largeSize: 20.0,
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: CachedCircleAvatar(
            url: url,
            name: name,
            avatarHeight: avatarHeight,
            avatarWidth: avatarWidth,
            indicator: indicator,
          ),
        ),
      ),
    );
  }
}
