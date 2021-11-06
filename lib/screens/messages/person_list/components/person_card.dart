import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/participant_card.dart';

class PersonListCard<T> extends StatelessWidget {
  final double horizontalPadding;
  final ChatTable chat;
  final String? highlightText;
  final void Function()? onTap;

  const PersonListCard({
    Key? key,
    required this.chat,
    this.horizontalPadding = 15.0,
    this.highlightText,
    this.onTap,
  }) : super(key: key);

  void _onPersonTap() {
    if (onTap != null) {
      onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPersonTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: ParticipantCard(
          horizontalPadding: horizontalPadding,
          user: null,
          overrideTitle: chat.name,
          overrideAvatar: chat.avatar,
          avatarSize: 45.0,
          titleGap: 15.0,
          highlightTxt: highlightText != null ? highlightText! : "",
        ),
      ),
    );
  }
}
