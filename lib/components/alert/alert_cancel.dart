import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class CustomAlertCancel {
  final BuildContext context;
  final String? title;
  final String? body;
  final String? submitTxt;
  final void Function()? onSubmit;

  const CustomAlertCancel(this.context,
      {this.title, this.body, this.onSubmit, this.submitTxt});

  void call() {
    final fontSize = SizeConfig(context, 13).getProportionateScreenHeight;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          title ?? localizationInstance.cancel,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
        content: Text(
          body ?? localizationInstance.cancelHint,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: Text(
              localizationInstance.cancel,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
          TextButton(
            onPressed: onSubmit,
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            child: Text(
              submitTxt ?? localizationInstance.yes,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
