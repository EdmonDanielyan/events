import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/components/alert/alert_cancel.dart';
import 'package:ink_mobile/components/popup/popup_menu_container.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/select_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/providers/message_provider.dart';

import '../chat_screen.dart';

class HoverMessage extends StatelessWidget {
  final int index;
  final MessageWithUser messageWithUser;
  final Widget child;
  final bool ignore;
  const HoverMessage({
    Key? key,
    required this.index,
    required this.child,
    required this.messageWithUser,
    this.ignore = false,
  }) : super(key: key);

  static late AppLocalizations _strings;
  static late ChatCubit _chatCubit;

  MessageTable get message => messageWithUser.message!;

  void _onDelete(BuildContext context) {
    if (UseMessageProvider.initialized) {
      UseMessageProvider.messageProvider?.messageEditorSender
          .sendDeleteMessages([message], context);
    }
  }

  void _onCopy(BuildContext context) {
    Clipboard.setData(new ClipboardData(text: message.message));
    SimpleCustomSnackbar(
      context: context,
      txt: _strings.textCopied,
      duration: Duration(milliseconds: 300),
    );
  }

  void _onRespond() {
    _chatCubit.emitSelectedMessageId(message.id);
  }

  void _onEdit(BuildContext context) {
    _chatCubit.emitEditMessage(messageWithUser);
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _chatCubit = ChatScreen.of(context).chatCubit;
    final _chatScreenParams = ChatScreen.of(context).chatScreenParams;

    if (_chatScreenParams.ignoreHoverMessage || ignore) {
      return child;
    }

    return PopupMenuContainer<String>(
      blurBackground: true,
      child: child,
      items: SelectMessageMenuList(message)
          .getStandartList()
          .map((e) => menuItem(e))
          .toList(),
      onItemSelected: (value) async {
        if (value == _strings.quote) _onRespond();
        if (value == _strings.copy) _onCopy(context);
        if (value == _strings.delete) {
          Future.delayed(Duration(milliseconds: 200), () {
            CustomAlertCancel(
              context,
              title: _strings.delete,
              onSubmit: () {
                _onDelete(context);
                Navigator.of(context).pop();
              },
            ).call();
          });
        }

        if (value == _strings.edit) _onEdit(context);
      },
    );
  }

  static PopupMenuItem<String> menuItem(SelectMessageMenu e) {
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
