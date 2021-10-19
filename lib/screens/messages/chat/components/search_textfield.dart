import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class ChatSearchTextfield extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onUp;
  final void Function()? onDown;
  const ChatSearchTextfield({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    this.onUp,
    this.onDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    final _buttonWidth = (onUp != null || onDown != null) ? 100.0 : 0.0;
    return Stack(
      children: [
        TextFormField(
          autofocus: true,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            hintText: _strings.searchHint,
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(right: _buttonWidth),
          ),
          style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.search,
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: _buttonWidth,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (onUp != null) ...[
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.keyboard_arrow_up),
                    ),
                    onTap: onUp,
                  ),
                  SizedBox(width: 5),
                ],
                if (onDown != null) ...[
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                    onTap: onDown,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
