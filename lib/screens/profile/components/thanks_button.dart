import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import '../../../messenger/functions/size_config.dart';
import '../profile_screen.dart';

class ThanksButton extends StatelessWidget {
  final int userId;

  const ThanksButton({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    final ProfileCubit userCubit = ProfileScreen.of(context).profileCubit;
    return DefaultButton(
      onTap: () => userCubit.thanks(userId),
      title: _strings.thank,
      borderColor: Palette.greenE4A,
      textColor: Palette.greenE4A,
      suffixIcon: SvgPicture.asset(
        IconLinks.BARREL_SVG_LINK,
        height: 20.0,
        width: 20.0,
        color: Palette.greenE4A,
      ),
    );
  }
}
