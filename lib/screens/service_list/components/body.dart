import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/service_list/components/service_list_element.dart';
import 'package:ink_mobile/screens/service_list/components/service_list_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  static List<ServiceListItem> items = [
    ServiceListItem(
        title: 'Мои данные',
        svgPicturePath: 'assets/images/services_profile_icon.svg',
        link: '/personal'
    ),
    ServiceListItem(
        title: 'Обратная связь',
        svgPicturePath: 'assets/images/services_feedback_icon.svg',
        link: '/personal'
    ),
    ServiceListItem(
        title: 'Заказ служебного транспорта',
        svgPicturePath: 'assets/images/services_transport_request_icon.svg',
        link: '/personal'
    ),
    ServiceListItem(
        title: 'Заказ справок',
        svgPicturePath: 'assets/images/services_inquiry_request_icon.svg',
        link: '/personal'
    ),
    ServiceListItem(
        title: 'Оформление ДМС',
        svgPicturePath: 'assets/images/services_medical_insurance_icon.svg',
        link: '/personal'
    ),
    ServiceListItem(
        title: 'Социальный пакет',
        svgPicturePath: 'assets/images/services_social_package_icon.svg',
        link: '/social_package'
    ),
    ServiceListItem(
        title: 'Кадровые перемещения',
        svgPicturePath: 'assets/images/services_personnel_movement_icon.svg',
        link: '/personnel_movements'
    ),
    ServiceListItem(
        title: 'Дни рождения',
        svgPicturePath: 'assets/images/services_birthdays_icon.svg',
        link: '/birthdays'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        color: Colors.white,
        width: size.width,
        margin: EdgeInsets.only(top: 18),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey
            );
          },
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ServiceListElement(
                title: items[index].title,
                svgPicturePath: items[index].svgPicturePath,
                link: items[index].link
            );
          },
        )
      );
  }
}
