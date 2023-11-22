import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/messenger/constants/svg_pictures.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class MessageTick extends StatelessWidget {
  final MessageStatus status;
  final bool isRead;
  final Color color;
  final MessageType type;
  const MessageTick(
    this.status, {
    Key? key,
    this.isRead = false,
    required this.color,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == MessageType.info) {
      return const SizedBox.shrink();
    }

    String asset = "";
    // Color color = Palette.white.withOpacity(0.5);
    // Color color = Palette.text20Grey;

    if (isRead) {
      asset = IconLinks.DOUBLE_CHECK_ICON_LINK;
    } else if (status == MessageStatus.sending ||
        status == MessageStatus.error) {
      asset = SvgPictures.clock;
    } else if (status == MessageStatus.sent) {
      asset = SvgPictures.tick;
    }

    const iconSize = 16.0;

    return SvgPicture.asset(asset,
        width: iconSize,
        height: iconSize,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  }
}
