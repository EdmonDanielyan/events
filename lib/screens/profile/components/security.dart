import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import 'section_title.dart';

class ProfileSecuritySection extends StatefulWidget {
  final bool isTablet;
  const ProfileSecuritySection({Key? key, required this. isTablet})
      : super(key: key);

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
    return CustomLayoutBuilder(builder: (context, constraints, isTablet) {
      return Container(
        width: size.width,
        margin: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SectionTitle(title: _strings.security, isTablet: isTablet),
            ),
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
                      )),
                  width: size.width,
                  child: ListTile(
                    title: Text(
                      _strings.setPinCode,
                      style: TextStyle(fontSize: widget.isTablet ? 18 : 14),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.of(context).pushNamed("/set_pin"),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
