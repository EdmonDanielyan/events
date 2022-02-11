import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/messenger/screens/chat/components/attach_screen.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/form_entities.dart';

class AttachIcon extends StatelessWidget {
  final Function(ChatEntities)? onSend;
  const AttachIcon({Key? key, this.onSend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CustomBottomSheet(
        context: context,
        child: ChatAttachScreen(
          onSend: onSend,
        ),
      ),
      child: Transform.rotate(
        angle: math.pi / -4,
        child: Icon(Icons.attach_file),
      ),
    );
  }
}
