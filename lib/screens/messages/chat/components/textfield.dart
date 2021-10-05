import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class MessageTextfield extends StatelessWidget {
  const MessageTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Container(
      padding: EdgeInsets.only(bottom: 15.0, top: 8.0),
      child: TextFormField(
        minLines: 1,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: "${_strings.writeHint}...",
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 11.0,
          ),
        ),
      ),
    );
  }
}
