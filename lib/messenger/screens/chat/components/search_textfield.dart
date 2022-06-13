import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/textfield/native_field.dart';

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
    final _buttonWidth = (onUp != null || onDown != null) ? 150.0 : 0.0;
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[700],
      ),
      child: Stack(
        children: [
          NativeTextfield(
            autofocus: true,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            hint: "Поиск",
            hintStyle: const TextStyle(color: Colors.white70),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(right: _buttonWidth),
            iosPadding: EdgeInsets.only(right: _buttonWidth),
            style: TextStyle(color: textColor ?? Colors.white),
            textInputAction: TextInputAction.search,
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: SizedBox(
              width: _buttonWidth,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onUp != null) ...[
                    InkWell(
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child:
                            Icon(Icons.keyboard_arrow_up, color: Colors.white),
                      ),
                      onTap: onUp,
                    ),
                    const SizedBox(width: 5),
                  ],
                  if (onDown != null) ...[
                    InkWell(
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Colors.white),
                      ),
                      onTap: onDown,
                    ),
                  ],
                  const SizedBox(width: 5),
                  InkWell(
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    onTap: onClose,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
