import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/screens/service_list/components/service_list_item.dart';
import 'package:ink_mobile/screens/service_list/service_list_page_viewer.dart';

class ServiceListElement extends StatelessWidget {
  final ServiceListItem item;
  const ServiceListElement({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _metrica();
        if (item.pageViewerId != null) {
          ServiceListPageViewerState.pageViewer.pageController
              .jumpToPage(item.pageViewerId!);
        } else {
          Navigator.pushNamed(context, item.link);
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 22.0, right: 32.0, top: 16.0, bottom: 16.0),
        height: 60,
        child: Row(
          children: [
            SvgPicture.asset(
              item.svgPicturePath,
              width: 24.0,
              height: 24.0,
              color: Palette.greenE4A,
            ),
            Container(
              margin: EdgeInsets.only(left: 14),
              child: Text(
                item.title,
                style: FontStyles.rubikP1(color: Palette.textBlack),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                    color: Palette.greenE4A,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  _metrica(){
    switch(item.link) {
      case '/feedback':
        AppMetrica.reportEvent('вход пользователя в раздел «Обратная связь»');
        break;
      case '/references':
        AppMetrica.reportEvent('вход пользователя в раздел «Заказ справок»');
        break;
      case '/medical_insurance':
        AppMetrica.reportEvent('вход пользователя в раздел «Оформление ДМС»');
        break;
      case '/social_package':
        AppMetrica.reportEvent('вход пользователя в раздел «Социальный пакет»');
        break;
      case '/personnel_movements':
        AppMetrica.reportEvent('вход пользователя в раздел «Кадровые перемещения»');
        break;
      case '/birthdays':
        AppMetrica.reportEvent('вход пользователя в раздел «Дни рождения»');
        break;
    }
  }
}
