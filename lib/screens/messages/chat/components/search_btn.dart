import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/constants/aseets.dart';

class MessageSearchBtn extends StatelessWidget {
  final void Function()? onPressed;
  const MessageSearchBtn({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(SEARCH_ICON, color: Colors.white),
    );
  }
}
