import 'package:flutter/material.dart';

class SelectableWidget extends StatefulWidget {
  final bool isOn;
  final Widget child;
  final bool selected;
  final void Function(bool)? onSwitch;
  const SelectableWidget({
    Key? key,
    this.onSwitch,
    this.selected = false,
    this.isOn = false,
    required this.child,
  }) : super(key: key);

  @override
  _SelectableWidgetState createState() => _SelectableWidgetState(selected);
}

class _SelectableWidgetState extends State<SelectableWidget> {
  bool selected;

  _SelectableWidgetState(this.selected);

  @override
  void didUpdateWidget(covariant SelectableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selected != widget.selected) {
      _setSelect(widget.selected);
    }
  }

  void _setSelect(bool newSelect) {
    setState(() {
      selected = newSelect;
    });

    if (widget.onSwitch != null) {
      widget.onSwitch!(newSelect);
    }
  }

  void _switchState() => _setSelect(!selected);

  @override
  Widget build(BuildContext context) {
    if (widget.isOn == false) {
      return widget.child;
    }

    return Container(
      decoration: BoxDecoration(
        color: selected ? Colors.grey[400] : Colors.transparent,
      ),
      child: InkWell(
        onTap: _switchState,
        child: Row(
          children: [
            Expanded(
              child: IgnorePointer(child: widget.child),
            ),
          ],
        ),
      ),
    );
  }
}
