import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class UserPickerRadio extends StatefulWidget {
  final bool enabled;
  final void Function(bool)? onTap;
  const UserPickerRadio({Key? key, required this.enabled, this.onTap})
      : super(key: key);

  @override
  State<UserPickerRadio> createState() => _UserPickerRadioState();
}

class _UserPickerRadioState extends State<UserPickerRadio> {
  void _onTap() {
    if (widget.onTap != null) {
      widget.onTap!(!widget.enabled);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enabled) {
      return InkWell(
        child: Icon(
          Icons.check_circle,
          color: Colors.lightBlue[300],
          size: SizeConfig(context, 22).getProportionateScreenHeight,
        ),
        onTap: _onTap,
      );
    }

    return InkWell(
      child: Icon(
        Icons.circle_outlined,
        color: Colors.grey,
        size: SizeConfig(context, 22).getProportionateScreenHeight,
      ),
      onTap: _onTap,
    );
  }
}
