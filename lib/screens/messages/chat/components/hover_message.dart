import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/popup/popup_menu_container.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/chat/select_menu.dart';
import 'package:ink_mobile/screens/messages/chat/functions/message_cubit_functions.dart';
import 'package:ink_mobile/screens/messages/chat/functions/message_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HoverMessage extends StatelessWidget {
  final int index;
  final Message message;
  final Widget child;
  const HoverMessage(
      {Key? key,
      required this.index,
      required this.child,
      required this.message})
      : super(key: key);

  static late AppLocalizations _strings;
  static late ChatCubit _chatCubit;

  void _onDelete(BuildContext context) =>
      ChatMessageCubitFunctions(context).deleteMessages([message]);

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

  void _onSelect() {
    TextFieldUtils.loseTextFieldFocus();
    _chatCubit.selectMessage(index, true);
  }

  void _onSendOn(BuildContext context) {
    MessageFunctions(context: context, strings: _strings).sendOn([message]);
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _chatCubit = BlocProvider.of<ChatCubit>(context);
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
