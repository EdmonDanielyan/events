import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/chat/message.dart';

class RespondMessageContainer extends StatelessWidget {
  final void Function()? onCancel;
  final Message selectedMessage;
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

  static late LanguageStrings _strings;

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
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
    return Text(
      selectedMessage.byMe ? _strings.you : selectedMessage.user.name,
      style: TextStyle(
        color: selectedMessage.byMe ? Colors.green : Colors.purple[200],
        fontSize: 12.5,
      ),
    );
  }

  Widget _cancelWidget() {
    return InkWell(
      onTap: onCancel,
      child: Icon(
        Icons.cancel,
        size: 14,
      ),
    );
  }

  Widget _textWidget() {
    return Text(
      selectedMessage.message,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12.0,
        color: txtColor ?? Colors.black,
      ),
    );
  }
}
