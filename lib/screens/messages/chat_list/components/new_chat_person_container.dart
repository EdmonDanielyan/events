import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/participant_card.dart';

class NewChatPersonContainer extends StatelessWidget {
  final UserTable user;
  final bool enabled;
  final double titleGap;
  final String highlightTxt;
  final double avatarSize;
  final Function(bool)? onChanged;
  const NewChatPersonContainer({
    Key? key,
    this.enabled = false,
    required this.user,
    this.highlightTxt = "",
    this.titleGap = 15.0,
    this.avatarSize = 40.0,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          Expanded(
            child: ParticipantCard(
              highlightTxt: highlightTxt,
              user: user,
              owner: null,
              admins: null,
              horizontalPadding: 0.0,
              avatarSize: avatarSize,
              titleGap: titleGap,
            ),
          ),
          Radio<bool>(
            value: enabled,
            groupValue: true,
            toggleable: true,
            activeColor: Colors.blue,
            onChanged: (_) {
              if (onChanged != null) {
                onChanged!(!enabled);
              }
            },
          ),
        ],
      ),
    );
  }
}
