import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/messages/chat/components/attach_icon.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

class MessageTextfield extends StatelessWidget {
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(ChatEntities)? onSend;
  const MessageTextfield({
    Key? key,
    this.onChanged,
    this.focusNode,
    this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Container(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            onChanged: onChanged,
            minLines: 1,
            maxLines: 3,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: "${_strings.writeHint}...",
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              isDense: true,
              contentPadding: EdgeInsets.only(
                top: 10.0,
                bottom: 10,
                left: 11.0,
                right: 28.0,
              ),
            ),
          ),
          // Container(
          //     padding: EdgeInsets.only(right: 10.0),
          //     child: AttachIcon(onSend: onSend)),
        ],
      ),
    );
  }
}
