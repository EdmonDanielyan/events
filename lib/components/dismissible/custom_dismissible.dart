import 'package:flutter/material.dart';

class CustomDismissible extends StatelessWidget {
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final void Function(DismissDirection)? onDismissed;
  final Widget child;
  const CustomDismissible(
      {Key? key, this.confirmDismiss, this.onDismissed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Dismissible(
        background: const SizedBox.shrink(),
        direction: DismissDirection.endToStart,
        secondaryBackground: Icon(Icons.delete, color: Colors.red),
        confirmDismiss: confirmDismiss,
        resizeDuration: null,
        onDismissed: onDismissed,
        key: UniqueKey(),
        child: child,
      ),
    );
  }
}
