import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/cached_image/avatar_indicator.dart';
import 'package:ink_mobile/functions/files.dart';

import 'avatar_placeholder.dart';

class CachedCircleAvatar extends StatelessWidget {
  final String url;
  final double indicatorSize;
  final double? avatarWidth;
  final double? avatarHeight;
  final bool indicator;
  final String name;
  const CachedCircleAvatar({
    Key? key,
    required this.url,
    this.indicatorSize = 12.0,
    this.avatarWidth,
    this.avatarHeight,
    this.indicator = false,
    this.name = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: avatarWidth,
          height: avatarHeight,
          child: isStrPicture(url)
              ? CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => AvatarPlaceholder(text: name),
                  errorWidget: (context, url, error) {
                    return AvatarPlaceholder(text: name);
                  },
                  imageBuilder: (context, image) {
                    return CircleAvatar(
                      radius: 48.0,
                      foregroundImage: image,
                    );
                  },
                  fadeInDuration: const Duration(milliseconds: 0),
                  fadeOutDuration: const Duration(milliseconds: 0),
                )
              : AvatarPlaceholder(text: name),
        ),
        if (indicator) ...[
          AvatarIndicator(indicatorSize: indicatorSize),
        ],
      ],
    );
  }
}
