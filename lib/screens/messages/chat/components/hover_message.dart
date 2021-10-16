import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/popup/popup_menu_container.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/chat/select_menu.dart';
import 'package:ink_mobile/screens/messages/chat/functions/message_functions.dart';

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

  static late LanguageStrings _strings;
  static late ChatCubit _chatCubit;

  void _onDelete(BuildContext context) =>
      ChatMessageFunctions(context).deleteMessages([message]);

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

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    _chatCubit = BlocProvider.of<ChatCubit>(context);
    return PopupMenuContainer<String>(
      blurBackground: true,
      child: child,
      items: SelectMessageMenuList.getStandartList(_strings)
          .map((e) => menuItem(e))
          .toList(),
      onItemSelected: (value) async {
        if (value == _strings.delete) _onDelete(context);
        if (value == _strings.copy) _onCopy(context);
        if (value == _strings.reply) _onRespond();
        if (value == _strings.select) _onSelect();
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
