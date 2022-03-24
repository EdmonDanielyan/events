import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class MessageTextfield extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  const MessageTextfield({
    Key? key,
    required this.textEditingController,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  @override
  State<MessageTextfield> createState() =>
      _MessageTextfieldState(textEditingController);
}

class _MessageTextfieldState extends State<MessageTextfield> {
  final TextEditingController textEditingController;

  _MessageTextfieldState(this.textEditingController);
  String _originalHint = "${localizationInstance.writeHint}...";
  String? _hintText;

  @override
  void initState() {
    widget.focusNode?.addListener(() {
      if (widget.focusNode!.hasFocus) {
        setState(() {
          _hintText = "";
        });
      } else {
        setState(() {
          _hintText = _originalHint;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Platform.isIOS
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
                    controller: textEditingController,
                    onChanged: widget.onChanged,
                    minLines: 1,
                    maxLines: 3,
                    placeholder: _hintText ?? _originalHint,
                    textCapitalization: TextCapitalization.sentences,
                    focusNode: widget.focusNode,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.transparent,
                    ),
                  ),
                )
              : TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: textEditingController,
                  onChanged: widget.onChanged,
                  minLines: 1,
                  maxLines: 3,
                  maxLength: 1000,
                  focusNode: widget.focusNode,
                  enableSuggestions: true,
                  autocorrect: true,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: _hintText ?? _originalHint,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
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
                ),
        ],
      ),
    );
  }
}
