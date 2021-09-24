import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/basic_information_row.dart';
import 'package:ink_mobile/screens/profile/components/section_title.dart';

class BasicInformation extends StatelessWidget {
  static late LanguageStrings _strings;
  final UserBasicInfo? info;
  const BasicInformation({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    if (info != null) {
      return getBasicInfoWidget(context);
    } else {
      return Container();
    }
  }

  Widget getBasicInfoWidget(context) {
    if (info!.organization != null ||
        info!.address != null ||
        info!.birthday != null ||
        info!.office != null) {
      Size size = MediaQuery.of(context).size;
      return Container(
        width: size.width,
        margin: EdgeInsets.only(top: 24, bottom: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SectionTitle(title: _strings.mainInformation),
            ),
            Column(children: getBasicInfoWidgetRows())
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
            BasicInfoRow(title: element['title'], value: element['value']));
      }
    });

    return widgetRows;
  }

  List getRowsInfo() {
    return [
      {'title': _strings.company, 'value': info!.organization},
      {'title': _strings.address, 'value': info!.address},
      {'title': _strings.office, 'value': info!.office},
      {'title': _strings.birthday, 'value': info!.birthday},
    ];
  }
}
