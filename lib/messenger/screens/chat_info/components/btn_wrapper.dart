import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/screens/chat_info/entities/design_entities.dart';

class ChatInfoBtnWrapper extends StatelessWidget {
  final void Function()? onTap;
  final Widget icon;
  final List<Widget> children;

  const ChatInfoBtnWrapper({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ChatInfoDesignEntities.horizontalPadding,
        ),
        margin: EdgeInsets.only(bottom: 2.0),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: ChatInfoDesignEntities.titleGap),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
