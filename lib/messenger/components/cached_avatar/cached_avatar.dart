import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/validators/validators/text_validator.dart';
import 'avatar_file.dart';
import 'avatar_indicator.dart';
import 'avatar_placeholder.dart';

class CachedCircleAvatar extends StatelessWidget {
  final String url;
  final double? avatarWidth;
  final double? avatarHeight;
  final String name;
  final Color backgroundColor;
  final Duration fadeInDuration;
  final bool indicator;
  final double indicatorSize;
  const CachedCircleAvatar({
    Key? key,
    required this.url,
    this.avatarWidth,
    this.avatarHeight,
    this.name = "",
    this.backgroundColor = Colors.blue,
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.indicator = false,
    this.indicatorSize = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _child;

    final validator = TextValidator(url);
    if (validator.hasHttp() && validator.isStringUrl()) {
      _child = CachedNetworkImage(
        imageUrl: url,
        fadeInDuration: fadeInDuration,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            AvatarPlaceholder(text: name, backgroundColor: backgroundColor),
        errorWidget: (context, url, error) {
          return AvatarPlaceholder(
            text: name,
            backgroundColor: backgroundColor,
          );
        },
        imageBuilder: (context, image) {
          return CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 30,
            foregroundImage: image,
          );
        },
      );
    } else if (validator.isStringUrl()) {
      _child =
          AvatarFile(url: url, backgroundColor: backgroundColor, text: name);
    } else {
      _child = AvatarPlaceholder(text: name, backgroundColor: backgroundColor);
    }

    return Stack(
      children: [
        SizedBox(width: avatarWidth, height: avatarHeight, child: _child),
        if (indicator) ...[
          Positioned(
            right: 0,
            bottom: 0,
            child: AvatarIndicator(indicatorSize: indicatorSize),
          ),
        ],
      ],
    );
  }
}
