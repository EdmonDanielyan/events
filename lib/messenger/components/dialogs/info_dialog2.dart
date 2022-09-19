import 'package:flutter/material.dart';

class InfoDialog2 {
  final BuildContext context;
  final String title;
  final String? close;
  final void Function()? onPressed;

  const InfoDialog2({
    required this.context,
    required this.title,
    this.close,
    this.onPressed,
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
                const Icon(Icons.warning, color: Color(0XFFF9595F)),
                const SizedBox(height: 15.0),
                if (title.isNotEmpty) ...[
                  Text(
                    title,
                    style: const TextStyle(fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15.0),
                ],
                TextButton(
                  child: Text(close ?? "Закрыть"),
                  onPressed: onPressed ??
                      () {
                        Navigator.of(context).pop();
                      },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0XFF1068D7),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
