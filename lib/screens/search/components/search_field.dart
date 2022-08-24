import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

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
  Color? _fillColor;

  @override
  void initState() {
    super.initState();

    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _hintText = "";
          _fillColor = Colors.white;
        });
      } else {
        setState(() {
          _hintText = widget.hint;
          _fillColor = Colors.grey[100];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(50.0),
      shadowColor: Colors.grey,
      child: Platform.isIOS
          ? Container(
              padding: const EdgeInsets.only(
                left: 11.0,
                right: 28.0,
                top: 5.0,
                bottom: 5.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: NativeTextInput(
                      style: TextStyle(
                        fontSize: SizeConfig(context, 14)
                            .getProportionateScreenHeight,
                      ),
                      iosOptions: IosOptions(
                          placeholderStyle: TextStyle(
                        fontSize: SizeConfig(context, 14)
                            .getProportionateScreenHeight,
                      )),
                      onChanged: widget.onChanged,
                      textCapitalization: TextCapitalization.sentences,
                      focusNode: _textFieldFocus,
                      placeholder: _hintText ?? widget.hint,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  SvgPicture.asset(
                    SEARCH_ICON,
                    color: Colors.grey[700],
                    width: SizeConfig(context, 18).getProportionateScreenHeight,
                    height:
                        SizeConfig(context, 18).getProportionateScreenHeight,
                  ),
                ],
              ),
            )
          : TextFormField(
              focusNode: _textFieldFocus,
              onChanged: widget.onChanged,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                fontSize: SizeConfig(context, 14).getProportionateScreenHeight,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize:
                      SizeConfig(context, 14).getProportionateScreenHeight,
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                suffixIconConstraints:
                    BoxConstraints(minHeight: 20, minWidth: 20),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SvgPicture.asset(
                    SEARCH_ICON,
                    color: Colors.grey[700],
                    width: SizeConfig(context, 20).getProportionateScreenWidth,
                    height:
                        SizeConfig(context, 20).getProportionateScreenHeight,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                fillColor: _fillColor,
                hintText: _hintText ?? widget.hint,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.grey, width: 15.0),
                ),
              ),
            ),
    );
  }
}
