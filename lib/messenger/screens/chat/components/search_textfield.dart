import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/textfield/native_field.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/messenger/screens/chat/components/textfield.dart';

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
    final _searchTextEditingController = TextEditingController();
    return Row(
      children: [
        InkWell(
          child: SvgPicture.asset(
            IconLinks.CLOSE_ICON,
            height: 28.0,
            width: 28.0,
            color: Palette.textBlack50,
          ),
          onTap: onClose,
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: ChatTextField(
            textEditingController: _searchTextEditingController,
            focusNode: FocusNode(),
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            hint: "Поиск",
          ),
        ),
        const SizedBox(width: 16.0),
        if (onUp != null) ...[
          InkWell(
            child: Icon(
              Icons.keyboard_arrow_up,
              color: Palette.greenE4A,
              size: 28.0,
            ),
            onTap: onUp,
          ),
          const SizedBox(width: 5),
        ],
        if (onDown != null) ...[
          InkWell(
            child: Icon(
              Icons.keyboard_arrow_down,
              color: Palette.greenE4A,
              size: 28,
            ),
            onTap: onDown,
          ),
        ],
        const SizedBox(width: 5),
        InkWell(
          onTap: () => onFieldSubmitted?.call(_searchTextEditingController.text),
        child: SvgPicture.asset(
            IconLinks.SEARCH_ICON,
            height: 28.0,
            width: 28.0,
            color: Palette.greenE4A,
          ),
        ),
      ],
    );
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
