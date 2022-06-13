import 'package:flutter/material.dart';

class CustomDismissible extends StatelessWidget {
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final void Function(DismissDirection)? onDismissed;
  final Widget child;
  final Key uniqueKey;
  const CustomDismissible({
    Key? key,
    this.confirmDismiss,
    this.onDismissed,
    required this.child,
    required this.uniqueKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onDismissed == null) {
      return child;
    }

    return Material(
      child: Dismissible(
        key: uniqueKey,
        background: const SizedBox(),
        direction: DismissDirection.endToStart,
        secondaryBackground: const Icon(Icons.delete, color: Colors.red),
        confirmDismiss: confirmDismiss,
        resizeDuration: null,
        onDismissed: onDismissed,
        child: child,
      ),
    );
  }
}
