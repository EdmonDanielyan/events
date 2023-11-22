import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/birthday_data.dart';

class BirthdayBody extends StatelessWidget {
  final BirthdayData birthday;
  const BirthdayBody({Key? key, required this.birthday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          birthday.workPosition ?? "",
          style: FontStyles.rubikP3(color: Palette.textBlack50),
        ),
        Text(
          birthday.city?.trim() ?? "",
          style: FontStyles.rubikP3(color: Palette.textBlack50),
        ),
      ],
    );
  }
}
