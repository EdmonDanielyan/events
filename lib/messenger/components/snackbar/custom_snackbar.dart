import 'package:flutter/material.dart';

abstract class CustomSnackbar {
  abstract final BuildContext context;
  abstract final String txt;
}

class SimpleCustomSnackbar extends CustomSnackbar {
  @override
  final BuildContext context;
  @override
  final String txt;
  final Duration duration;

  SimpleCustomSnackbar({
    required this.context,
    required this.txt,
    this.duration = const Duration(seconds: 1),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(txt),
        duration: duration,
      ),
    );
  }
}

class SuccessCustomSnackbar extends CustomSnackbar {
  @override
  final BuildContext context;
  @override
  final String txt;
  final Duration duration;

  SuccessCustomSnackbar({
    required this.context,
    required this.txt,
    this.duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.only(bottom: 70.0),
        duration: duration,
        content: Row(
          children: [
            const Icon(
              Icons.check,
              color: Colors.lightGreen,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                txt,
                style: const TextStyle(color: Colors.lightGreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorCustomSnackbar extends CustomSnackbar {
  @override
  final BuildContext context;
  @override
  final String txt;
  final Duration duration;

  ErrorCustomSnackbar({
    required this.context,
    required this.txt,
    this.duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.only(bottom: 60.0),
        duration: duration,
        content: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                txt,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HideSnackBar {
  final BuildContext context;
  HideSnackBar(this.context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
