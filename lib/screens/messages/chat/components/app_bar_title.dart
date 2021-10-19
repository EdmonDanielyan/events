import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat.dart';

class ChatAppBarTitle extends StatelessWidget {
  final Chat chat;
  const ChatAppBarTitle({Key? key, required this.chat}) : super(key: key);

  bool get isGroup => chat.group != null;

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/chat_info"),
      child: Column(
        children: [
          Text(
            chat.chatName,
            style: TextStyle(fontSize: 17.0),
            textAlign: TextAlign.center,
          ),
          if (!isGroup) ...[
            Text(
              _strings.online,
              style: TextStyle(fontSize: 13.0, color: Colors.blueGrey[300]),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
