import 'package:flutter/material.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/basic_information_row.dart';
import 'package:ink_mobile/screens/profile/components/section_title.dart';

class BasicInformation extends StatelessWidget {
  final UserBasicInfo? info;
  const BasicInformation({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (info != null) {
      return getBasicInfoWidget(context);
    } else {
      return Container();
    }
  }

  Widget getBasicInfoWidget(context) {
    if (
      info!.organization != null ||
      info!.address != null ||
      info!.birthday != null ||
      info!.office != null
    ) {
      Size size = MediaQuery.of(context).size;
      return Container(
        width: size.width,
        margin: EdgeInsets.only(top: 24, bottom: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SectionTitle(title: 'Основная информация'),
            ),
            Column(
              children: getBasicInfoWidgetRows()
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  List<Widget> getBasicInfoWidgetRows() {
    List<Widget> widgetRows = [];

    getRowsInfo().forEach((element) {
      if (element['value'] != null) {
        widgetRows.add(
            BasicInfoRow(title: element['title'], value: element['value'])
        );
      }
    });

    return widgetRows;
  }

  List getRowsInfo() {
    return [
      {
        'title': 'Организация',
        'value': info!.organization
      },
      {
        'title': 'Адрес',
        'value': info!.address
      },
      {
        'title': 'Кабинет',
        'value': info!.office
      },
      {
        'title': 'День рождения',
        'value': info!.birthday
      },
    ];
  }
}
