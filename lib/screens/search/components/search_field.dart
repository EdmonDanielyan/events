import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/constants/aseets.dart';

class SearchField extends StatefulWidget {
  final String hint;
  final void Function(String)? onChanged;
  const SearchField({Key? key, this.onChanged, this.hint = ""})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  FocusNode _textFieldFocus = FocusNode();
  String? _hintText;

  @override
  void initState() {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        focusNode: _textFieldFocus,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(50.0),
          ),
          suffixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SvgPicture.asset(
              SEARCH_ICON,
              color: Colors.grey[700],
              width: 20,
              height: 20,
            ),
          ),
          fillColor: Colors.white,
          hintText: _hintText ?? widget.hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.red, width: 15.0),
          ),
        ),
      ),
    );
  }
}
