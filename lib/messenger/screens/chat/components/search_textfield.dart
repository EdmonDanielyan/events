import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/textfield/native_field.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

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
    final textSize = SizeConfig(context, 13.0).getProportionateScreenHeight;
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
            hintStyle: TextStyle(color: Colors.white70, fontSize: textSize),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(right: _buttonWidth),
            iosPadding: EdgeInsets.only(right: _buttonWidth),
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: textSize,
            ),
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
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: SizeConfig(context, 18.0)
                              .getProportionateScreenHeight,
                        ),
                      ),
                      onTap: onUp,
                    ),
                    const SizedBox(width: 5),
                  ],
                  if (onDown != null) ...[
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: SizeConfig(context, 18.0)
                              .getProportionateScreenHeight,
                        ),
                      ),
                      onTap: onDown,
                    ),
                  ],
                  const SizedBox(width: 5),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: SizeConfig(context, 18.0)
                            .getProportionateScreenHeight,
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
