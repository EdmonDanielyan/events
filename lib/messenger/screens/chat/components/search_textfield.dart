import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/screens/chat/components/textfield.dart';

class ChatSearchTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onUp;
  final void Function()? onDown;
  final void Function()? onClose;
  final int currentIndex;
  final int itemsLength;
  final Color? textColor;
  const ChatSearchTextField(
      {Key? key,
      this.onChanged,
      this.onFieldSubmitted,
      this.onUp,
      this.onDown,
      required this.onClose,
      this.textColor,
      required this.currentIndex,
      required this.itemsLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _searchTextEditingController = TextEditingController();
    int displayingIndex = itemsLength == 0 ? 0 : currentIndex + 1;
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$displayingIndex из $itemsLength",
              style: FontStyles.rubikP2Medium(color: Palette.textBlack50),
            ),
            const Spacer(),
            if (onUp != null) ...[
              InkWell(
                onTap: onUp,
                child: SizedBox.square(
                  dimension: 44.0,
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: Palette.greenE4A,
                      size: 28.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
            ],
            if (onDown != null) ...[
              InkWell(
                onTap: onDown,
                child: SizedBox.square(
                  dimension: 44.0,
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Palette.greenE4A,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(
              width: 8.0,
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: onClose,
              child: SvgPicture.asset(IconLinks.CLOSE_ICON,
                  height: 28.0,
                  width: 28.0,
                  colorFilter:
                      ColorFilter.mode(Palette.textBlack50, BlendMode.srcIn)),
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
            InkWell(
              onTap: () =>
                  onFieldSubmitted?.call(_searchTextEditingController.text),
              child: SvgPicture.asset(IconLinks.SEARCH_ICON,
                  height: 28.0,
                  width: 28.0,
                  colorFilter:
                      ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
            ),
          ],
        ),
      ],
    );
  }
}
