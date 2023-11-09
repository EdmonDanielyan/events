import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/palette.dart';

class UserPickerRadio extends StatefulWidget {
  final bool enabled;
  final void Function(bool)? onTap;
  const UserPickerRadio({Key? key, required this.enabled, this.onTap})
      : super(key: key);

  @override
  State<UserPickerRadio> createState() => _UserPickerRadioState();
}

class _UserPickerRadioState extends State<UserPickerRadio> {
  @override
  Widget build(BuildContext context) {
    bool enabled = widget.enabled;
    return InkWell(
      child: Container(
        height: 20.0,
        width: 20.0,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: enabled ? Palette.greenE4A : Palette.transparent,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Palette.text20Grey,
            width: enabled ? 0.0 : 1.0,
          ),
        ),
        child: enabled
            ? SvgPicture.asset(
                IconLinks.TICK_ICON,
                height: 16.0,
                width: 16.0,
                color: Palette.white,
              )
            : null,
      ),
      onTap: () => widget.onTap?.call(!widget.enabled),
    );
  }
}
