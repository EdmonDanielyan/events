import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/screens/chat/components/textfield.dart';

class ChatSearchTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onUp;
  final void Function()? onDown;
  final void Function()? onClose;
  final Color? textColor;
  const ChatSearchTextField({
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
  }
}
