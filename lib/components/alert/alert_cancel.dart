import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class CustomAlertCancel {
  final BuildContext context;
  final void Function()? onSubmit;

  const CustomAlertCancel(this.context, {this.onSubmit});

  void call() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(localizationInstance.cancel),
        content: Text(localizationInstance.cancelHint),
        actions: [
          TextButton(
            child: Text(localizationInstance.cancel),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(localizationInstance.yes),
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}
