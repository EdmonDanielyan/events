import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

class MessageTextfield extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(ChatEntities)? onSend;
  const MessageTextfield({
    Key? key,
    required this.textEditingController,
    this.onChanged,
    this.focusNode,
    this.onSend,
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
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: textEditingController,
            onChanged: widget.onChanged,
            minLines: 1,
            maxLines: 3,
            maxLength: 1000,
            focusNode: widget.focusNode,
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
