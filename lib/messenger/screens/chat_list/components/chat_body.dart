import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_message.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

import '../../../../localization/i18n/i18n.dart';

class ChatListBody extends StatelessWidget {
  final MessageTable? lastMessage;
  final MessageTable? searchMessage;
  final String highlightValue;
  final ChatTable chat;
  final UserTable? lastUser;
  const ChatListBody({
    Key? key,
    required this.chat,
    required this.lastMessage,
    required this.searchMessage,
    this.highlightValue = "",
    required this.lastUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (lastMessage == null) return const SizedBox();

    final _message = searchMessage ?? lastMessage!;
    String msg = _message.message;

    if (!chat.isGroup()) {
      if (_message.type == StoredMessageType.USER_JOINED ||
          _message.type == StoredMessageType.USER_LEFT) {
        msg = "";
      }
    }

    String? displayName;

    if (lastMessage != null && lastMessage!.type == StoredMessageType.TEXT) {
      if (chat.isGroup() && lastUser != null) {
        displayName = lastUser!.id == JwtPayload.myId
            ? localizationInstance.you
            : lastUser!.name;
      }
    }

    return ChatMessage(
      displayName: displayName,
      message: msg,
      highlightValue: highlightValue.trim(),
    );
  }
}
