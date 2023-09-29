import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class DefaultTextField extends StatefulWidget {
  final String hint;
  final void Function(String)? onChanged;
  final Widget? icon;
  final FocusNode focusNode;

  DefaultTextField({
    Key? key,
    required this.focusNode,
    this.onChanged,
    this.hint = "",
    this.icon,
  }) : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.focusNode.hasFocus
                  ? Palette.greenE4A
                  : Palette.text20Grey),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            if (widget.focusNode.hasFocus)
              BoxShadow(
                color: Palette.greenE4A.withOpacity(0.25),
                blurRadius: 8.0,
                blurStyle: BlurStyle.outer,
              ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: widget.focusNode,
                onChanged: widget.onChanged,
                maxLines: 1,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(border: InputBorder.none),
                //placeholder: widget.hint,
                // iosOptions: IosOptions(
                //   placeholderStyle:
                //       FontStyles.rubikP2(color: Palette.textBlack50),
                // ),
                style: FontStyles.rubikP2(color: Palette.textBlack),
                //placeholderColor: Palette.textBlack50,
              ),
            ),
            InkWell(
              onTap: () {
                controller.text = '';
                widget.onChanged?.call('');
              },
              child: Icon(Icons.close),
            ),
            if (widget.icon != null) ...[
              const SizedBox(width: 10.0),
              widget.icon!,
            ],
          ],
        ),
      ),
    );
  }
}
