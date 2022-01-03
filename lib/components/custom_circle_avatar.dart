import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String? url;
  final File? file;
  final ImageProvider? imageProvider;
  final bool indicator;
  final double indicatorSize;
  final double? avatarWidth;
  final double? avatarHeight;
  final String name;
  const CustomCircleAvatar({
    Key? key,
    this.url,
    this.file,
    this.imageProvider,
    this.indicator = false,
    this.avatarWidth,
    this.avatarHeight,
    this.name = "",
    this.indicatorSize = 12.0,
  })  : assert(url != null || file != null || imageProvider != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: avatarWidth,
          height: avatarHeight,
          child: getAvatar(),
        ),
        if (indicator) ...[
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.circle,
                color: Colors.green[800],
                size: indicatorSize,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget getAvatar() {
    if (url != null) return getAvatarByUrl();
    if (file != null) return getAvatarByFile();
    if (imageProvider != null)
      return getAvatarByUrl(imgProvider: imageProvider);

    return const SizedBox();
  }

  Widget getAvatarByUrl({ImageProvider? imgProvider}) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.purple,
      backgroundImage: imgProvider ??
          (name.isEmpty
              ? AssetImage("assets/images/avatars/avatar_default.png")
              : null),
      foregroundImage: NetworkImage(url!),
      onForegroundImageError: (Object exception, _) {},
      child: name.isEmpty
          ? null
          : Text(
              ChatUserViewModel.cutName(name).toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
    );
  }

  Widget getAvatarByFile() {
    return ClipOval(
      child: Image.file(
        file!,
        fit: BoxFit.cover,
      ),
    );
  }
}
