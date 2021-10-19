import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class SearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  const SearchBar({Key? key, this.contentPadding, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Container(
      padding: contentPadding,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "${_strings.find}...",
          hintStyle: TextStyle(color: Colors.grey[700]),
          suffixIcon: Icon(Icons.search, color: Colors.grey[700]),
          border: InputBorder.none,
        ),
        maxLines: 1,
      ),
    );
  }
}
