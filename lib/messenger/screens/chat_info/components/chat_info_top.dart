import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/constants/enums.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/absence.dart';

class ChatInfoTop extends StatelessWidget {
  final String url;
  final String name;
  final String description;
  final String subDescription;
  final void Function()? onTap;
  final Absence? absence;
  const ChatInfoTop({
    Key? key,
    required this.url,
    required this.name,
    this.description = "",
    this.subDescription = "",
    this.onTap,
    this.absence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatBadge chatBadge = ChatBadge.none;
    String iconLink = "";
    Color backgroundColor = Palette.white;
    if (absence != null) {
      switch (absence!.reason) {
        case AbsenceReason.vacation:
          chatBadge = ChatBadge.vacation;
          iconLink = IconLinks.SUN_ICON;
          backgroundColor = Palette.yellow300;
          break;
        case AbsenceReason.businessTrip:
          chatBadge = ChatBadge.businessTrip;
          iconLink = IconLinks.PLANE_ICON;
          backgroundColor = Palette.purple255;
          break;
        default:
          break;
      }
    }
    return Row(
      children: [
        GestureDetector(
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
            child: CachedCircleAvatar(
              url: url,
              name: name,
              avatarHeight: 68.0,
              avatarWidth: 68.0,
            ),
          ),
        ),
        SizedBox(width: SizeConfig(context, 13.0).getProportionateScreenHeight),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onTap,
                child: GoogleText(
                  name,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      SizeConfig(context, 18.0).getProportionateScreenHeight,
                  maxLines: 2,
                ),
              ),
              if (description.isNotEmpty) ...[
                const SizedBox(height: 5.0),
                GoogleText(
                  description,
                  fontSize:
                      SizeConfig(context, 11.0).getProportionateScreenHeight,
                  color: const Color(0XFF757678),
                  maxLines: 2,
                ),
              ],
              if (subDescription.isNotEmpty) ...[
                const SizedBox(height: 5.0),
                GoogleText(
                  subDescription,
                  fontSize:
                      SizeConfig(context, 11.0).getProportionateScreenHeight,
                  color: const Color(0XFF757678),
                  maxLines: 2,
                ),
              ],
            ],
          ),
        )
      ],
    );
  }
}
