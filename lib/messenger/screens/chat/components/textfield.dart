import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class ChatTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  const ChatTextField({
    Key? key,
    required this.textEditingController,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final String _originalHint = "Написать...";

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            padding: const EdgeInsets.only(
              left: 11.0,
              right: 28.0,
              top: 2.0,
              bottom: 2.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: NativeTextInput(
              controller: widget.textEditingController,
              onChanged: widget.onChanged,
              minLines: 1,
              maxLines: 3,
              placeholder: _originalHint,
              textCapitalization: TextCapitalization.sentences,
              focusNode: widget.focusNode,
              style: TextStyle(
                fontSize:
                    SizeConfig(context, 13.0).getProportionateScreenHeight,
              ),
              iosOptions: IosOptions(
                placeholderStyle: TextStyle(
                  fontSize:
                      SizeConfig(context, 13.0).getProportionateScreenHeight,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.transparent,
              ),
            ),
          )
        : TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: widget.textEditingController,
            onChanged: widget.onChanged,
            minLines: 1,
            maxLines: 3,
            maxLength: 1000,
            focusNode: widget.focusNode,
            enableSuggestions: true,
            autocorrect: true,
            style: TextStyle(
              fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
            ),
            decoration: InputDecoration(
              counterText: "",
              hintText: _originalHint,
              hintStyle: TextStyle(
                fontSize:
                    SizeConfig(context, 13.0).getProportionateScreenHeight,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10,
                left: 11.0,
                right: 28.0,
              ),
            ),
          );
  }
}
