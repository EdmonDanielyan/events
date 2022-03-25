import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/components/alert/alert_cancel.dart';
import 'package:ink_mobile/components/popup/popup_menu_container.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/core/cubit/bool_cubit/bool_cubit.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat/chat_cubit.dart';
import 'package:ink_mobile/messenger/cases/send_message.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/select_menu.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/chat_screen_params.dart';
import 'package:ink_mobile/setup.dart';
import '../chat_screen.dart';

class HoverMessage extends StatelessWidget {
  final int index;
  final MessageWithUser messageWithUser;
  final Widget child;
  final bool ignore;
  final ChatScreenParams chatScreenParams;
  final BoolCubit emojiShown;
  const HoverMessage({
    Key? key,
    required this.index,
    required this.child,
    required this.messageWithUser,
    this.ignore = false,
    required this.chatScreenParams,
    required this.chatCubit,
    required this.emojiShown,
  }) : super(key: key);

  static late AppLocalizations _strings;
  static late SelectableCubit<MessageWithUser> _selectableCubit;
  final ChatCubit chatCubit;

  MessageTable get message => messageWithUser.message!;

  Future<void> _onDelete(
    BuildContext context,
  ) async {
    if (sl<Messenger>().isConnected) {
      final messenger = sl<Messenger>();
      await messenger.messageEditorSender
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
    chatCubit.emitSelectedMessageId(message.id);
  }

  void _onEdit(BuildContext context) {
    chatCubit.emitEditMessage(messageWithUser);
  }

  void _onSelect() {
    _selectableCubit.addItem(messageWithUser);
  }

  void _onSendOn(BuildContext context) {
    final sendMessage = sl<SendMessage>();
    sendMessage.sendOn([message], context);
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _selectableCubit = ChatScreen.of(context).selectableCubit;

    if (chatScreenParams.ignoreHoverMessage || ignore) {
      return child;
    }

    return PopupMenuContainer<String>(
      blurBackground: true,
      child: child,
      onTap: () {
        TextFieldUtils.loseTextFieldFocus();
        emojiShown.setNew(false);
      },
      items: SelectMessageMenuList(message)
          .getStandartList()
          .map((e) => menuItem(e))
          .toList(),
      onItemSelected: (value) async {
        if (value == _strings.quote) _onRespond();
        if (value == _strings.sendOn) _onSendOn(context);
        if (value == _strings.copy) _onCopy(context);
        if (value == _strings.select) _onSelect();
        if (value == _strings.delete) {
          Future.delayed(Duration(milliseconds: 200), () {
            CustomAlertCancel(
              context,
              title: _strings.delete,
              body: _strings.messageDeleteHint,
              submitTxt: _strings.delete,
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
