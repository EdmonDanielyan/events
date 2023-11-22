import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/service_list/components/service_list_element.dart';
import 'package:ink_mobile/screens/service_list/components/service_list_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _strings = localizationInstance;

    List<ServiceListItem> items = ServiceListItemListView.getItems(_strings);

    return SizedBox(
      width: size.width,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Palette.text20Grey,
              height: 1,
              thickness: 1,
            );
          },
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ServiceListElement(item: items[index]);
          },
        ),
      ),
    );
  }
}
