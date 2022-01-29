import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/tables/db_enum.dart';

class ChatTick extends StatelessWidget {
  final Brightness brightness;

  final MessageTable? message;
  const ChatTick({
    Key? key,
    this.message,
    this.brightness = Brightness.dark,
  }) : super(key: key);

  bool get isDark => brightness == Brightness.dark;

  String getTickImage() {
    if (message?.sentStatus == MessageSentStatus.SENDING) return "assets/images/clock.svg";
    if (message?.read ?? false)
      return "assets/images/double_tick.svg";
    return "assets/images/tick.svg";
  }

  Color getColor() {
    if (message?.read ?? false)
      return isDark ? Colors.white : Colors.blue[600]!;
    return isDark ? Colors.grey[300]! : Colors.grey;
  }

  double getSize() => 13.0;

  @override
  Widget build(BuildContext context) {
    if ([MessageSentStatus.ERROR, MessageSentStatus.EMPTY].contains(message?.sentStatus))
      return SizedBox();

    return SvgPicture.asset(
      getTickImage(),
      width: getSize(),
      height: getSize(),
      color: getColor(),
    );
  }
}
