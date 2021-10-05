import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class SearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  const SearchBar({Key? key, this.contentPadding, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
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
