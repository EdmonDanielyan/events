import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/functions/send_log.dart';
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
    return getSendLogsButonWidget(context);
  }

  Widget getSendLogsButonWidget(context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SectionTitle(title: _strings.diagnostics),
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
                    title: Text("Обратиться в техподдержку"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () =>
                        launchUrl('https://portal.irkutskoil.ru/login/report/'),
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade400, width: 0.5),
                      bottom:
                          BorderSide(color: Colors.grey.shade400, width: 0.5),
                    )),
                width: size.width,
                child: ListTile(
                  title: Text("Информация о работе приложения"),
                  subtitle: Text("Отправить разработчикам"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => sendErrorLog(widget.logFile),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
