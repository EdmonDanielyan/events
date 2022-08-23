import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/fancy_text.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class AvatarPlaceholder extends StatelessWidget {
  final String text;
  const AvatarPlaceholder({Key? key, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool textEmpty = text.trim().isEmpty;
    return CircleAvatar(
      radius: SizeConfig(context, 30).getProportionateScreenHeight,
      backgroundColor: Colors.purple,
      foregroundImage: textEmpty
          ? AssetImage(
              "assets/images/avatars/avatar_default.png",
            )
          : null,
      child: textEmpty
          ? null
          : Text(
              FancyText(text).cutName().toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Noto",
              ),
            ),
    );
  }
}
