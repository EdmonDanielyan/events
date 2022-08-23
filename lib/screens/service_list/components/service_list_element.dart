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
}
