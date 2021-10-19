import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/screens/messages/chat/components/attach_screen.dart';

class AttachIcon extends StatelessWidget {
  const AttachIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          CustomBottomSheet(context: context, child: ChatAttachScreen()),
      child: Transform.rotate(
        angle: math.pi / -4,
        child: Icon(Icons.attach_file),
      ),
    );
  }
}
