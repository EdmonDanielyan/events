import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/messenger/constants/svg_pictures.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class MessageTick extends StatelessWidget {
  final MessageStatus status;
  final bool isRead;
  final Color? tickColor;
  final Color? clockColor;
  final Color? readColor;
  final MessageType type;
  const MessageTick(
    this.status, {
    Key? key,
    this.isRead = false,
    this.tickColor,
    this.clockColor,
    this.readColor,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == MessageType.info) {
      return const SizedBox.shrink();
    }

    String asset = "";
    Color color = Colors.black;

    if (isRead) {
      asset = IconLinks.DOUBLE_CHECK_ICON_LINK;
      color = readColor ?? const Color(0XFF5FB9CF);
    } else if (status == MessageStatus.sending ||
        status == MessageStatus.error) {
      asset = SvgPictures.clock;
      color = clockColor ?? const Color(0XFFBBBBBB);
    } else if (status == MessageStatus.sent) {
      asset = SvgPictures.tick;
      color = tickColor ?? const Color(0XFFBBBBBB);
    }

    final iconSize = 16.0;

    return SvgPicture.asset(
      asset,
      width: iconSize,
      height: iconSize,
      color: color,
    );
  }
}
