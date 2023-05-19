import 'package:flutter/material.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/birthday_data.dart';

class BirthdayAvatar extends StatelessWidget {
  final BirthdayData birthday;
  const BirthdayAvatar({Key? key, required this.birthday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedCircleAvatar(
      url: birthday.pathToAvatar ?? "",
      avatarWidth: SizeConfig(context, 55).getProportionateScreenHeight,
      avatarHeight: SizeConfig(context, 55).getProportionateScreenHeight,
    );
  }
}
