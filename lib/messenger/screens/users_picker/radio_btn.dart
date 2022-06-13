import 'package:flutter/material.dart';

class UserPickerRadio extends StatefulWidget {
  final bool enabled;
  final void Function(bool)? onTap;
  const UserPickerRadio({Key? key, required this.enabled, this.onTap})
      : super(key: key);

  @override
  State<UserPickerRadio> createState() => _UserPickerRadioState();
}

class _UserPickerRadioState extends State<UserPickerRadio> {
  bool enabled = false;

  @override
  void initState() {
    super.initState();
    enabled = widget.enabled;
  }

  void _onTap() {
    setState(() {
      enabled = !enabled;
    });

    if (widget.onTap != null) {
      widget.onTap!(enabled);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return InkWell(
        child: Icon(
          Icons.check_circle,
          color: Colors.lightBlue[300],
        ),
        onTap: _onTap,
      );
    }

    return InkWell(
      child: const Icon(
        Icons.circle_outlined,
        color: Colors.grey,
      ),
      onTap: _onTap,
    );
  }
}
