import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/error_messages.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class ErrorRefreshButton extends StatelessWidget {
  final bool isTablet;
  final void Function() onTap;
  final String buttonText;
  final String text;
  const ErrorRefreshButton({
    Key? key,
    required this.onTap,
    this.buttonText = 'Обновить',
    this.text = ErrorMessages.SIMPLE_ERROR_MESSAGE,
    this.isTablet = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(
                  Theme.of(context).primaryColor)),
          onPressed: onTap,
          child: Text(
            _strings.reload,
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig(context, 14).getProportionateScreenHeight),
          ),
        )
      ],
    ));
  }
}
