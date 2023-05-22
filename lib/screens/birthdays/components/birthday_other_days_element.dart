import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_body.dart';

import '../../../messenger/functions/size_config.dart';
import 'birthday_avatar.dart';

class BirthdayOtherDaysElement extends StatelessWidget {
  const BirthdayOtherDaysElement({Key? key, required this.birthday})
      : super(key: key);

  final BirthdayData birthday;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/personal',
          arguments: {'id': birthday.id},
        );
      },
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BirthdayAvatar(birthday: birthday),
            const SizedBox(width: 12.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    birthday.name ?? '',
                    style: FontStyles.rubikP2Medium(color: Palette.textBlack),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  BirthdayBody(birthday: birthday),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
