import 'package:flutter/material.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class DefaultTextField extends StatelessWidget {
  final String hint;
  final void Function(String)? onChanged;
  final Widget? icon;
  final FocusNode focusNode;
  const DefaultTextField({
    Key? key,
    required this.focusNode,
    this.onChanged,
    this.hint = "",
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: focusNode.hasFocus
                  ? Palette.greenE4A
                  : Palette.text20Grey),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            if (focusNode.hasFocus)
              BoxShadow(
                color: Palette.greenE4A.withOpacity(0.25),
                blurRadius: 8.0,
                blurStyle: BlurStyle.outer,
              ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: NativeTextInput(
                focusNode: focusNode,
                onChanged: onChanged,
                maxLines: 1,
                textCapitalization: TextCapitalization.sentences,
                placeholder: hint,
                iosOptions: IosOptions(
                  placeholderStyle:
                      FontStyles.rubikP2(color: Palette.textBlack50),
                ),
                style: FontStyles.rubikP2(color: Palette.textBlack),
                placeholderColor: Palette.textBlack50,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 10.0),
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}
