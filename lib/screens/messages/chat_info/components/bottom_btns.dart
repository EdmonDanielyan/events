import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat_info/chat_info_screen.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatInfoBottomBtns extends StatelessWidget {
  final ChatTable chat;
  const ChatInfoBottomBtns({Key? key, required this.chat}) : super(key: key);

  static late ChatDatabaseCubit _chatDatabaseCubit;
  static late ChatFunctions _chatFunctions;
  static late AppLocalizations _strings;

  bool get isGroup => ChatListView.isGroup(chat);

  void _clearMessages() {
    _chatFunctions.deleteAllChatMessages(chat.id);
  }

  void _deleteChat(BuildContext context) {
    _clearMessages();
    _chatFunctions.deleteChat(chat.id);
    UseMessageProvider.messageProvider.removeChat(chat);
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _chatDatabaseCubit = ChatInfoScreen.of(context).chatDatabaseCubit;
    _chatFunctions = ChatFunctions(_chatDatabaseCubit);

    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          clearChat(),
          Divider(color: Colors.grey, height: 1.0),
          leaveChat(context),
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
