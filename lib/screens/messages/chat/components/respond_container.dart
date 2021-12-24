import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';

class RespondMessageContainer extends StatelessWidget {
  final void Function()? onCancel;
  final MessageWithUser selectedMessage;
  final double horizontalPadding;
  final Color? txtColor;
  final Color? bgColor;
  const RespondMessageContainer({
    Key? key,
    this.horizontalPadding = 7.0,
    this.onCancel,
    this.txtColor,
    this.bgColor,
    required this.selectedMessage,
  }) : super(key: key);

  static late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: _titleWidget(),
              ),
              if (onCancel != null) ...[
                _cancelWidget(),
              ],
            ],
          ),
          SizedBox(height: 2.0),
          _textWidget(),
        ],
      ),
    );
  }

  Widget _titleWidget() {
    bool isByMe = MessageListView.isByMe(selectedMessage.message!);
    return Text(
      isByMe ? _strings.you : selectedMessage.user!.name,
      style: TextStyle(
        color: isByMe ? Colors.green : Colors.purple[200],
        fontSize: 12.5,
      ),
    );
  }

  Widget _cancelWidget() {
    return InkWell(
      onTap: onCancel,
      child: Icon(
        Icons.cancel,
        size: 19,
      ),
    );
  }

  Widget _textWidget() {
    return Text(
      selectedMessage.message!.message,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12.0,
        color: txtColor ?? Colors.black,
      ),
    );
  }
}
