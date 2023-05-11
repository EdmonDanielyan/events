import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import 'section_title.dart';

class Diagnostics extends StatefulWidget {
  final String logFile;
  const Diagnostics({Key? key, required this.logFile}) : super(key: key);

  @override
  State<Diagnostics> createState() => _DiagnosticsState();
}

class _DiagnosticsState extends State<Diagnostics> {
  late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return getSendLogsButtonWidget(context);
  }

  Widget getSendLogsButtonWidget(context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: _strings.diagnostics,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade400, width: 0.5),
                    bottom: BorderSide(color: Colors.grey.shade400, width: 0.5),
                  ),
                ),
                height: 52.0,
                width: size.width,
                padding: const EdgeInsets.only(left: 20.0, right: 32.0),
                child: InkWell(
                  onTap: () => launchUrl(UrlsConfig.supportUrl),
                  child: Row(
                    children: [
                      Text(
                        "Обратиться в техподдержку",
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
          ),
        ],
      ),
    );
  }
}
