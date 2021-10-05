import 'package:flutter/material.dart';

class ChatAppBarTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  const ChatAppBarTitle({Key? key, required this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 17.0),
          textAlign: TextAlign.center,
        ),
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: TextStyle(fontSize: 13.0, color: Colors.blueGrey[300]),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
