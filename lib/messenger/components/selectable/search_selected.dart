import 'package:flutter/material.dart';

class SearchSelected extends StatefulWidget {
  final bool selected;
  final Widget child;
  const SearchSelected({
    Key? key,
    required this.child,
    this.selected = false,
  }) : super(key: key);

  @override
  State<SearchSelected> createState() => _SearchSelectedState();
}

class _SearchSelectedState extends State<SearchSelected> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color:
          widget.selected ? Colors.black.withOpacity(0.2) : Colors.transparent,
      child: widget.child,
    );
  }
}
