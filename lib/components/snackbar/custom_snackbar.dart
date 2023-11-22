import 'package:flutter/material.dart';

import '../../messenger/functions/size_config.dart';

abstract class CustomSnackbar {
  abstract BuildContext context;
  abstract String txt;
}

class SimpleCustomSnackbar extends CustomSnackbar {
  @override
  BuildContext context;
  @override
  String txt;
  final Duration duration;

  SimpleCustomSnackbar({
    required this.context,
    required this.txt,
    this.duration = const Duration(seconds: 1),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          txt,
          style: TextStyle(
            fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
          ),
        ),
        duration: duration,
      ),
    );
  }
}

class SuccessCustomSnackbar extends CustomSnackbar {
  @override
  BuildContext context;
  @override
  String txt;
  final Duration duration;

  SuccessCustomSnackbar({
    required this.context,
    required this.txt,
    this.duration = const Duration(seconds: 1),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        content: Row(
          children: [
            const Icon(Icons.check, color: Colors.lightGreen),
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
