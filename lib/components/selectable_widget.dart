import 'package:flutter/material.dart';

class SelectableWidget extends StatelessWidget {
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

  void setSelect(bool newSelect) {
    if (onSwitch != null) {
      onSwitch!(newSelect);
    }
  }

  void _switchState() => setSelect(!selected);

  @override
  Widget build(BuildContext context) {
    if (isOn == false) {
      return child;
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
              child: IgnorePointer(child: child),
            ),
          ],
        ),
      ),
    );
  }
}
