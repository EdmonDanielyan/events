import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class ErrorRefreshButton extends StatelessWidget {
  const ErrorRefreshButton(
      {Key? key,
      required this.onTap,
      this.buttonText = 'Обновить',
      this.text = ErrorMessages.SIMPLE_ERROR_MESSAGE})
      : super(key: key);

  final Function onTap;
  final String buttonText;
  final String text;

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(
                  Theme.of(context).primaryColor)),
          onPressed: () {
            onTap();
          },
          child: Text(
            _strings.reload,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }
}
