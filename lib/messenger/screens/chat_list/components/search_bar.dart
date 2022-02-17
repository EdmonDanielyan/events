import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  const SearchBar(
      {Key? key, this.controller, this.contentPadding, this.onChanged})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode _textFieldFocus = FocusNode();
  String _originalHint = "${localizationInstance.find}...";
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
          _hintText = _originalHint;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.contentPadding,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Platform.isIOS
          ? Container(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: NativeTextInput(
                      onChanged: widget.onChanged,
                      maxLines: 1,
                      textCapitalization: TextCapitalization.sentences,
                      focusNode: _textFieldFocus,
                      placeholder: _hintText ?? _originalHint,
                      placeholderColor: Colors.grey[700],
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      SEARCH_ICON,
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
            )
          : TextField(
              controller: widget.controller,
              focusNode: _textFieldFocus,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                contentPadding: widget.contentPadding,
                hintText: _hintText ?? _originalHint,
                hintStyle: TextStyle(color: Colors.grey[700]),
                suffixIconConstraints:
                    BoxConstraints(minHeight: 24, minWidth: 24),
                suffixIcon: Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child:
                        SvgPicture.asset(SEARCH_ICON, color: Colors.grey[700])),
                border: InputBorder.none,
              ),
              maxLines: 1,
            ),
    );
  }
}
