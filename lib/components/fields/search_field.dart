import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/fields/default_text_field.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/constants/svg_pictures.dart';

class SearchField extends StatefulWidget {
  final String hint;
  final void Function(String)? onChanged;
  const SearchField({Key? key, this.onChanged, this.hint = ""})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final FocusNode _textFieldFocus = FocusNode();
  String _hintText = "";

  @override
  void initState() {
    super.initState();

    _hintText = widget.hint;
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _hintText = "";
        });
      } else {
        setState(() {
          _hintText = widget.hint;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      focusNode: _textFieldFocus,
      hint: _hintText,
      onChanged: widget.onChanged,
      icon: SvgPicture.asset(
        SvgPictures.search,
        width: 20.0,
        height: 20.0,
        colorFilter: ColorFilter.mode(Palette.textBlack, BlendMode.srcIn),
      ),
    );
  }
}
