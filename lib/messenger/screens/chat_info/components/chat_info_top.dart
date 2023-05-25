import 'package:flutter/material.dart';
import 'package:ink_mobile/components/avatar_with_badge.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
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
    return Row(
      children: [
        AvatarWithBadge(
          onTap: onTap,
          avatarHeight: 68.0,
          avatarWidth: 68.0,
          absence: absence,
          url: url,
          name: name,
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
