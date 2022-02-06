import 'package:flutter/material.dart';
import 'package:ink_mobile/app.dart';

void showErrorDialog(
  String message, {
  String title = 'Ошибка',
  List<TextButton>? actions,
}) {
  var buildContext = App.materialKey!.currentContext;
  if (buildContext == null) return;
  showDialog(
      context: buildContext,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(message),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          actions: actions ??
              [
                TextButton(
                  child: Text(
                    'Закрыть',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    maxLines: 1,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
        );
      });
}
