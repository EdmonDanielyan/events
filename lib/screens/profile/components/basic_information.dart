import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/basic_information_row.dart';
import 'package:ink_mobile/screens/profile/components/section_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasicInformation extends StatelessWidget {
  static late AppLocalizations _strings;
  final UserBasicInfo? info;
  const BasicInformation({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    if (info != null) {
      return getBasicInfoWidget(context);
    }
    return const SizedBox.shrink();
  }

  Widget getBasicInfoWidget(context) {
    if (info!.organization != null ||
        info!.address != null ||
        info!.birthday != null ||
        info!.office != null ||
        info!.department != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: _strings.mainInformation,
            ),
            const SizedBox(height: 24.0,),
            ...getBasicInfoWidgetRows(),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  List<Widget> getBasicInfoWidgetRows() {
    List<Widget> widgetRows = [];

    getRowsInfo().forEach(
      (element) {
        if (element['value'] != null) {
          widgetRows.add(
            BasicInfoRow(
              title: element['title'],
              value: element['value'],
            ),
          );
        }
      },
    );
    return widgetRows;
  }

  List getRowsInfo() {
    return [
      {'title': _strings.company, 'value': info!.organization},
      {'title': 'Подразделение', 'value': info!.department},
      {'title': _strings.address, 'value': info!.address},
      {'title': _strings.office, 'value': info!.office},
      {'title': _strings.birthday, 'value': info!.birthday},
      /// todo дополнительные поля в "Основоной информации"
      //{'title': 'Осталось на питание', 'value': "{0-3000} руб "},
      //{'title': 'Результаты тестов на ковид', 'value': "{ЗДОРОВ / COVID}"},
      //{'title': 'Оставшиеся дни отпуска', 'value': "{10}"},
    ];
  }
}
