import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class ChatSearchTextfield extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onUp;
  final void Function()? onDown;
  final void Function()? onClose;
  final Color? textColor;
  const ChatSearchTextfield({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    this.onUp,
    this.onDown,
    required this.onClose,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    final _buttonWidth = (onUp != null || onDown != null) ? 150.0 : 0.0;
    return Stack(
      children: [
        Platform.isIOS
            ? Container(
                padding: EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  right: _buttonWidth,
                ),
                child: NativeTextInput(
                  onChanged: onChanged,
                  maxLines: 1,
                  onSubmitted: (str) {
                    if (onFieldSubmitted != null && str != null) {
                      onFieldSubmitted!(str);
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  placeholder: _strings.searchHint,
                  placeholderColor: Colors.white70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.transparent,
                  ),
                  style: TextStyle(color: textColor ?? Colors.white),
                  keyboardType: KeyboardType.webSearch,
                ),
              )
            : TextFormField(
                autofocus: true,
                onChanged: onChanged,
                onFieldSubmitted: onFieldSubmitted,
                decoration: InputDecoration(
                  hintText: _strings.searchHint,
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(right: _buttonWidth),
                ),
                style: TextStyle(color: textColor ?? Colors.white),
                textInputAction: TextInputAction.search,
              ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: _buttonWidth,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (onUp != null) ...[
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.keyboard_arrow_up),
                    ),
                    onTap: onUp,
                  ),
                  SizedBox(width: 5),
                ],
                if (onDown != null) ...[
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                    onTap: onDown,
                  ),
                ],
                SizedBox(width: 5),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(Icons.close),
                  ),
                  onTap: onClose,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
