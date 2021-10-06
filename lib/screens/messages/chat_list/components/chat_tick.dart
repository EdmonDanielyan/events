import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/models/chat/message.dart';

class ChatTick extends StatelessWidget {
  final MessageStatus chatStatus;
  const ChatTick({Key? key, required this.chatStatus}) : super(key: key);

  String getTickImage() {
    if (chatStatus == MessageStatus.SENDING) return "assets/images/clock.svg";
    if (chatStatus == MessageStatus.READ)
      return "assets/images/double_tick.svg";
    return "assets/images/tick.svg";
  }

  Color getColor() {
    if (chatStatus == MessageStatus.READ) return Colors.blue[600]!;
    return Colors.grey[700]!;
  }

  double getSize() {
    if (chatStatus == MessageStatus.SENDING)
      return 8.0;
    else
      return 13.0;
  }

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
