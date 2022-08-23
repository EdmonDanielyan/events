import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/messenger/constants/svg_pictures.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

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
  final String _originalHint = "Найти...";

  @override
  Widget build(BuildContext context) {
    final searchIconSize =
        SizeConfig(context, 18.0).getProportionateScreenHeight;
    final iosPadding = SizeConfig(context, 7.0).getProportionateScreenHeight;
    return Container(
      padding: widget.contentPadding,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Platform.isIOS
          ? Container(
              padding: EdgeInsets.only(
                top: iosPadding,
                bottom: iosPadding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: NativeTextInput(
                      onChanged: widget.onChanged,
                      maxLines: 1,
                      textCapitalization: TextCapitalization.sentences,
                      placeholder: _originalHint,
                      iosOptions: IosOptions(
                        placeholderStyle: TextStyle(
                          fontSize: SizeConfig(context, 13.0)
                              .getProportionateScreenHeight,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: SizeConfig(context, 13.0)
                            .getProportionateScreenHeight,
                      ),
                      placeholderColor: Colors.grey[700],
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      SvgPictures.search,
                      width: searchIconSize,
                      height: searchIconSize,
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
            )
          : TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                contentPadding: widget.contentPadding,
                hintText: _originalHint,
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                  fontSize:
                      SizeConfig(context, 13.0).getProportionateScreenHeight,
                ),
                suffixIconConstraints:
                    const BoxConstraints(minHeight: 24, minWidth: 24),
                suffixIcon: Container(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SvgPicture.asset(
                    SvgPictures.search,
                    width: searchIconSize,
                    height: searchIconSize,
                    color: Colors.grey[700],
                  ),
                ),
                border: InputBorder.none,
              ),
              maxLines: 1,
            ),
    );
  }
}
