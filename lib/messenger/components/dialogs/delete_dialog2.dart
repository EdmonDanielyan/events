import 'package:flutter/material.dart';

class DeleteDialog2 {
  final BuildContext context;
  final String? title;
  final String? body;
  final Widget? bodyWidget;
  final String? ok;
  final String? cancel;
  final void Function(BuildContext context)? onConfirmPressed;
  final void Function()? onCancelPressed;
  final bool dismissible;
  final bool showCancel;

  const DeleteDialog2({
    required this.context,
    this.title,
    this.body,
    this.bodyWidget,
    this.ok,
    this.cancel,
    this.onConfirmPressed,
    this.onCancelPressed,
    this.dismissible = true,
    this.showCancel = true,
  });

  void call() {
    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (context) {
        final actions = [
          if (showCancel) ...[
            TextButton(
                onPressed: onCancelPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                child: Text(cancel ?? "Отмена")),
          ],
          TextButton(
              onPressed: onConfirmPressed != null
                  ? () => onConfirmPressed!(context)
                  : null,
              child: Text(ok ?? "Да"))
        ];

        return WillPopScope(
          onWillPop: () async {
            if (!dismissible) {
              return false;
            }

            return true;
          },
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.warning, color: Color(0XFFF9595F)),
                  const SizedBox(height: 25.0),
                  if (title != null) ...[
                    Text(
                      title!,
                      style: const TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15.0)
                  ],
                  if (bodyWidget != null) ...[
                    bodyWidget!,
                  ],
                  if (body != null) ...[
                    Text(
                      body!,
                      style: const TextStyle(fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0)
                  ],
                  Row(
                      mainAxisAlignment: actions.length == 1
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: actions),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
