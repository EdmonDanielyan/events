import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class ChatInfoTop extends StatelessWidget {
  final String url;
  final String name;
  final String description;
  final String subDescription;
  final void Function()? onTap;
  const ChatInfoTop({
    Key? key,
    required this.url,
    required this.name,
    this.description = "",
    this.subDescription = "",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CachedCircleAvatar(
            url: url,
            name: name,
            avatarHeight:
                SizeConfig(context, 60.0).getProportionateScreenHeight,
            avatarWidth: SizeConfig(context, 60.0).getProportionateScreenHeight,
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
