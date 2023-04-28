import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

import '../../../messenger/functions/size_config.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: FontStyles.rubikP2Medium(color: Palette.text20Grey),
          ),
        ),
      ],
    );
  }
}
