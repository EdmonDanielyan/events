import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/components/popup/popup_menu_container.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/select_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../chat_screen.dart';

class HoverMessage extends StatelessWidget {
  final int index;
  final MessageTable message;
  final Widget child;
  const HoverMessage(
      {Key? key,
      required this.index,
      required this.child,
      required this.message})
      : super(key: key);

  static late AppLocalizations _strings;
  static late ChatCubit _chatCubit;
  static late ChatDatabaseCubit _chatDatabaseCubit;

  void _onDelete(BuildContext context) =>
      ChatFunctions(_chatDatabaseCubit).deleteMessages([message]);

  void _onCopy(BuildContext context) {
    Clipboard.setData(new ClipboardData(text: message.message));
    SimpleCustomSnackbar(
      context: context,
      txt: _strings.textCopied,
      duration: Duration(milliseconds: 300),
    );
  }

  void _onRespond() {
    //_chatCubit.emitSelectedMessageId(message.id);
  }

  void _onSelect() {
    TextFieldUtils.loseTextFieldFocus();
    _chatCubit.selectMessage(index, true);
  }

  void _onSendOn(BuildContext context) {
    //MessageFunctions(context: context, strings: _strings).sendOn([message]);
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _chatCubit = ChatScreen.of(context).chatCubit;
    _chatDatabaseCubit = ChatScreen.of(context).chatDatabaseCubit;
    return PopupMenuContainer<String>(
      blurBackground: true,
      child: child,
      items: SelectMessageMenuList.getStandartList()
          .map((e) => menuItem(e))
          .toList(),
      onItemSelected: (value) async {
        if (value == _strings.reply) _onRespond();
        if (value == _strings.sendOn) _onSendOn(context);
        if (value == _strings.copy) _onCopy(context);
        if (value == _strings.select) _onSelect();
        if (value == _strings.delete) _onDelete(context);
      },
    );
  }

  PopupMenuItem<String> menuItem(SelectMessageMenu e) {
    return PopupMenuItem(
      value: e.name,
      child: Row(
        children: [
          e.icon,
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              e.name,
              maxLines: 1,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
