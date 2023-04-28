import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/service_list/components/service_list_item.dart';
import 'package:ink_mobile/screens/service_list/service_list_page_viewer.dart';

class ServiceListElement extends StatelessWidget {
  final ServiceListItem item;
  const ServiceListElement({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 60,
        child: Row(
          children: [
            SvgPicture.asset(
              item.svgPicturePath,
              width: SizeConfig(context, 40).getProportionateScreenHeight,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                item.title,
                style: TextStyle(
                    fontSize:
                        SizeConfig(context, 14).getProportionateScreenHeight),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: SizeConfig(context, 10).getProportionateScreenHeight,
                    color: Theme.of(context).primaryColor,
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
