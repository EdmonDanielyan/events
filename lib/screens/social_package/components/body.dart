import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/social_package/components/social_package_list_element.dart';
import 'package:ink_mobile/screens/social_package/components/social_package_list_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  static List<SocialPackageListItem> items = [
    SocialPackageListItem(
        title: 'Добровольное медицинское страхование',
        link: '/voluntary_medical_insurance'
    ),
    SocialPackageListItem(
        title: 'Страхование от несчастных случаев',
        link: '/accident_insurance'
    ),
    SocialPackageListItem(
        title: 'Материальная помощь',
        link: '/financial_aid'
    ),
    SocialPackageListItem(
        title: 'Детский отдых',
        link: '/children_rest'
    ),
    SocialPackageListItem(
        title: 'Новогодние подарки',
        link: '/christmas_gifts'
    ),
    SocialPackageListItem(
        title: 'Оздоровительные мероприятия',
        link: '/recreational_activities'
    )
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          color: Colors.white,
          child: Text('Социальный пакет', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        Container(
            color: Colors.white,
            width: size.width,
            height: 450,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                    color: Colors.grey
                );
              },
              itemCount: items.length,
              itemBuilder: (context, index) {
                return SocialPackageListElement(
                    title: items[index].title,
                    link: items[index].link
                );
              },
            )
        )
      ],
    );
  }
}
