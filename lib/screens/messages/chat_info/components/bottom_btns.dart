import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/extensions/chat_table.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/messenger.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/setup.dart';

class ChatInfoBottomBtns extends StatelessWidget {
  final ChatTable chat;
  final Messenger messenger = sl<Messenger>();
  ChatInfoBottomBtns({Key? key, required this.chat}) : super(key: key);

  static late AppLocalizations _strings;

  bool get isGroup => chat.isGroup();

  void _clearMessages() {
    if (isGroup) {
      messenger.chatFunctions.clearGroup(chat);
    } else {
      messenger.chatFunctions.clearSingleChat(chat);
    }
  }

  Future<void> _deleteChat(BuildContext context) async {
    if (messenger.isConnected) {
      messenger.chatEventsSender.sendLeftMessage(chat);

      _clearMessages();
      messenger.chatFunctions.deleteChat(chat.id);
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          clearChat(),
          if (isGroup) ...[
            Divider(color: Colors.grey, height: 1.0),
            leaveChat(context),
          ],
        ],
      ),
    );
  }

  Widget clearChat() {
    return textButton(
      onPressed: _clearMessages,
      color: Colors.blue,
      text: "${_strings.clear} ${_strings.chat.toLowerCase()}",
    );
  }

  Widget leaveChat(BuildContext context) {
    return textButton(
      onPressed: () => _deleteChat(context),
      color: Colors.red,
      text: isGroup
          ? "${_strings.leave} ${_strings.chat.toLowerCase()}"
          : "${_strings.delete} ${_strings.chat.toLowerCase()}",
    );
  }

  Widget textButton({
    required void Function()? onPressed,
    required Color color,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ChatInfoDesignEntities.horizontalPadding, vertical: 0.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}
