import 'package:flutter/material.dart';

class MessageCardPicture extends StatelessWidget {
  final String url;
  const MessageCardPicture({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.0),
      height: 210,
      width: 210,
      child: Image.network(
        url,
        fit: BoxFit.cover,
        errorBuilder: (context, stack, trance) {
          return CircleAvatar(
            radius: 1.0,
            backgroundColor: Colors.grey,
            foregroundImage:
                AssetImage("assets/images/avatars/avatar_default.png"),
            onForegroundImageError: (Object exception, _) {},
          );
        },
      ),
    );
  }
}
