import 'package:flutter/material.dart';

class GroupedListHeader extends StatefulWidget {
  final Widget child;
  final void Function()? onDispose;
  const GroupedListHeader({
    Key? key,
    required this.child,
    this.onDispose,
  }) : super(key: key);

  @override
  State<GroupedListHeader> createState() => _GroupedListHeaderState();
}

class _GroupedListHeaderState extends State<GroupedListHeader> {
  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
