import 'package:flutter/material.dart';

class ActionBtn extends StatelessWidget {
  final bool ignoring;
  final void Function()? onPressed;
  final String title;
  final Color? color;
  const ActionBtn({
    Key? key,
    this.ignoring = false,
    this.onPressed,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignoring,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.0,
            color: color ?? Colors.blue,
          ),
        ),
      ),
    );
  }
}
