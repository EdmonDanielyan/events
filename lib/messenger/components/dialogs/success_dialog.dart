import 'package:flutter/material.dart';

class SuccessDialog {
  final BuildContext context;
  final String? title;
  final String? body;
  final Widget? bodyWidget;
  final String? ok;
  final String? cancel;
  final void Function(BuildContext context)? onConfirmPressed;
  final void Function()? onCancelPressed;
  const SuccessDialog({
    required this.context,
    this.title,
    this.body,
    this.bodyWidget,
    this.ok,
    this.cancel,
    this.onConfirmPressed,
    this.onCancelPressed,
  });

  void call() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check, color: Color(0XFF259F75)),
                const SizedBox(height: 25.0),
                if (title != null) ...[
                  Text(
                    title!,
                    style: const TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15.0),
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
                  const SizedBox(height: 20.0),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (cancel != null) ...[
                      TextButton(
                        child: Text(cancel!),
                        onPressed: onCancelPressed ??
                            () {
                              Navigator.of(context).pop();
                            },
                        style: TextButton.styleFrom(primary: Colors.black),
                      ),
                    ],
                    if (ok != null) ...[
                      TextButton(
                        child: Text(ok!),
                        onPressed: onConfirmPressed != null
                            ? () => onConfirmPressed!(context)
                            : null,
                      )
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
