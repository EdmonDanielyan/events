import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final void Function(String)? onChanged;
  const SearchField({Key? key, this.onChanged, this.hint = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: Icon(Icons.search),
          fillColor: Colors.white,
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
