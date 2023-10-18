import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import 'section_title.dart';

class ProfileSecuritySection extends StatefulWidget {
  const ProfileSecuritySection({Key? key}) : super(key: key);

  @override
  State<ProfileSecuritySection> createState() => _ProfileSecuritySectionState();
}

class _ProfileSecuritySectionState extends State<ProfileSecuritySection> {
  late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return getSendLogsButtonWidget(context);
  }

  Widget getSendLogsButtonWidget(context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: _strings.security),
            SizedBox(
              height: 52.0,
              width: size.width,
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed("/set_pin"),
                child: Row(
                  children: [
                    Text(
                      _strings.setPinCode,
                      style: FontStyles.rubikP1(color: Palette.textBlack),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20.0,
                      color: Palette.greenE4A,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
