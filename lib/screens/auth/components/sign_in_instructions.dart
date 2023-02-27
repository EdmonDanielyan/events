import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import '../../../messenger/functions/size_config.dart';

class DefaultLinkButton extends StatelessWidget {
  final Color txtColor;
  final String? txt;
  final String link;
  const DefaultLinkButton({
    Key? key,
    this.txtColor = Colors.white,
    this.txt,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(
          link,
          formatUrl: false,
        );
      },
      child: Text(
        txt ?? localizationInstance.signInInstructions,
        style: FontStyles.rubikP2(
          color: txtColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
