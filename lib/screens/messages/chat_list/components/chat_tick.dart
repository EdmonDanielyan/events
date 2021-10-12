import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/models/chat/message.dart';

class ChatTick extends StatelessWidget {
  final MessageStatus chatStatus;
  final Brightness brightness;
  const ChatTick({
    Key? key,
    required this.chatStatus,
    this.brightness = Brightness.dark,
  }) : super(key: key);

  bool get isDark => brightness == Brightness.dark;

  String getTickImage() {
    if (chatStatus == MessageStatus.SENDING) return "assets/images/clock.svg";
    if (chatStatus == MessageStatus.READ)
      return "assets/images/double_tick.svg";
    return "assets/images/tick.svg";
  }

  Color getColor() {
    if (chatStatus == MessageStatus.READ)
      return isDark ? Colors.white : Colors.blue[600]!;
    return isDark ? Colors.grey[300]! : Colors.grey;
  }

  double getSize() => 13.0;

  @override
  Widget build(BuildContext context) {
    if (chatStatus == MessageStatus.ERROR) return SizedBox();

    return SvgPicture.asset(
      getTickImage(),
      width: getSize(),
      height: getSize(),
      color: getColor(),
    );
  }
}
