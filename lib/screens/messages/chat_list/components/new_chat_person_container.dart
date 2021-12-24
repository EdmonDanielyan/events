import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/participant_card.dart';
import 'package:ink_mobile/screens/messages/chat_list/entities/new_chat_screen_params.dart';

class NewChatPersonContainer extends StatelessWidget {
  final UserTable user;
  final bool enabled;
  final double titleGap;
  final String highlightTxt;
  final double avatarSize;
  final Function(bool)? onChanged;
  final NewChatScreenParams newChatScreenParams;
  const NewChatPersonContainer({
    Key? key,
    this.enabled = false,
    required this.user,
    this.highlightTxt = "",
    this.titleGap = 15.0,
    this.avatarSize = 40.0,
    this.onChanged,
    required this.newChatScreenParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: newChatScreenParams.onUserTap != null
                  ? () => newChatScreenParams.onUserTap!(context, user)
                  : null,
              child: ParticipantCard(
                highlightTxt: highlightTxt,
                user: user,
                horizontalPadding: 0.0,
                avatarSize: avatarSize,
                titleGap: titleGap,
                indicatorIsOn: false,
                indicatorReadOnly: true,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: !enabled ? 1 : 0,
                child: Radio<bool>(
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
              ),
              if (enabled) ...[
                InkWell(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.lightBlue[300],
                  ),
                  onTap: () {
                    if (onChanged != null) {
                      onChanged!(!enabled);
                    }
                  },
                )
              ],
            ],
          ),
        ],
      ),
    );
  }
}
