import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class ChatTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? hint;
  const ChatTextField({
    Key? key,
    required this.textEditingController,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.hint,
  }) : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final String _originalHint = "Написать...";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: widget.textEditingController,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      minLines: 1,
      maxLines: 6,
      maxLength: 1000,
      focusNode: widget.focusNode,
      enableSuggestions: true,
      autocorrect: true,
      style: FontStyles.rubikP2(color: Palette.textBlack),
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hint ?? _originalHint,
        hintStyle: FontStyles.rubikP2(color: Palette.textBlack50),
        border: OutlineInputBorder (
          borderSide: BorderSide(
            color: Palette.text20Grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder (
          borderSide: BorderSide(
            color: Palette.greenE4A.withOpacity(0.2),
            width: 4.0
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder (
          borderSide: BorderSide(
            color: Palette.text20Grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder (
          borderSide: BorderSide(
            color: Palette.text20Grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
      ),
    );
  }
}
