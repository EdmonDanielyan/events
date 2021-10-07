import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/messages/chat/components/attach_icon.dart';

class MessageTextfield extends StatelessWidget {
  const MessageTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Container(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
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
              contentPadding: EdgeInsets.only(
                top: 10.0,
                bottom: 10,
                left: 11.0,
                right: 28.0,
              ),
            ),
          ),
          Container(padding: EdgeInsets.only(right: 10.0), child: AttachIcon()),
        ],
      ),
    );
  }
}
