import 'package:flutter/material.dart';

class Selectable extends StatefulWidget {
  final Widget child;
  final void Function(bool)? onSelected;
  final bool selectOnTap;
  final bool selected;
  const Selectable({
    Key? key,
    required this.child,
    this.onSelected,
    this.selectOnTap = false,
    this.selected = false,
  }) : super(key: key);

  @override
  State<Selectable> createState() => _SelectableState();
}

class _SelectableState extends State<Selectable> {
  void _select(bool select) {
    if (widget.onSelected != null) {
      widget.onSelected!(select);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: !widget.selected ? () => _select(true) : null,
      onTap: widget.selectOnTap
          ? () => _select(!widget.selected)
          : widget.selected
              ? () => _select(false)
              : null,
      child: Container(
        decoration: BoxDecoration(
          color: widget.selected
              ? Colors.black.withOpacity(0.2)
              : Colors.transparent,
        ),
        child: IgnorePointer(
          ignoring: widget.selectOnTap || widget.selected,
          child: widget.child,
        ),
      ),
    );
  }
}
