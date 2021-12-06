import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class CustomAlertCancel {
  final BuildContext context;
  final String? title;
  final String? body;
  final void Function()? onSubmit;

  const CustomAlertCancel(this.context, {this.title, this.body, this.onSubmit});

  void call() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title ?? localizationInstance.cancel),
        content: Text(body ?? localizationInstance.cancelHint),
        actions: [
          TextButton(
            child: Text(localizationInstance.cancel),
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
          ),
          TextButton(
            child: Text(localizationInstance.yes),
            onPressed: onSubmit,
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
