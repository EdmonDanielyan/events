import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import '../../../messenger/functions/size_config.dart';
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
    return getSendLogsButonWidget(context);
  }

  Widget getSendLogsButonWidget(context) {
    Size size = MediaQuery.of(context).size;
    return CustomLayoutBuilder(
      builder: (context, constraints, isTablet) {
        return Container(
          width: size.width,
          margin: EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: _strings.security),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top:
                            BorderSide(color: Colors.grey.shade400, width: 0.5),
                        bottom:
                            BorderSide(color: Colors.grey.shade400, width: 0.5),
                      ),
                    ),
                    height: 52.0,
                    width: size.width,
                    padding: const EdgeInsets.only(left: 20.0, right: 32.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed("/set_pin"),
                      child: Row(
                        children: [
                          Text(
                            _strings.setPinCode,
                            style: FontStyles.rubikP1(color: Palette.textBlack),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 20.0,
                              color: Palette.greenE4A,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
