import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class SentOnWidget extends StatelessWidget {
  final Color? color;
  const SentOnWidget({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    final Color newColor = color ?? Colors.grey[400]!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          CupertinoIcons.arrowshape_turn_up_right_fill,
          color: newColor,
          size: 14,
        ),
        SizedBox(width: 10.0),
        Flexible(
          child: Text(
            _strings.forwardedMsg,
            style: TextStyle(
              color: newColor,
              fontStyle: FontStyle.italic,
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}
