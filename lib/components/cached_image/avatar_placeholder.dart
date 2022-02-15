import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';

class AvatarPlaceholder extends StatelessWidget {
  final String text;
  const AvatarPlaceholder({Key? key, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool textEmpty = text.trim().isEmpty;
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.purple,
      foregroundImage: textEmpty
          ? AssetImage(
              "assets/images/avatars/avatar_default.png",
            )
          : null,
      child: textEmpty
          ? null
          : Text(
              ChatUserViewModel.cutName(text).toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Noto",
              ),
            ),
    );
  }
}
