import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  final String url;
  final bool? indicator;
  const ChatAvatar({Key? key, required this.url, this.indicator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          backgroundImage:
              AssetImage("assets/images/avatars/avatar_default.png"),
          foregroundImage: NetworkImage(url),
          onForegroundImageError: (Object exception, _) {
            print("Error handling foreground image");
          },
        ),
        if (indicator != null && indicator!) ...[
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
                size: 12.0,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
