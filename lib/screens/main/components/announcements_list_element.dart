import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:intl/intl.dart';

import '../../../messenger/functions/size_config.dart';

class AnnouncementsListElement extends StatelessWidget {
  final AnnouncementData announcement;
  const AnnouncementsListElement({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/announcement_detail',
              arguments: {'id': announcement.id});
        },
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                    child: Row(children: [
                  Text(
                    announcement.dateCreate != null
                        ? DateFormat('dd.MM.yyyy')
                            .format(announcement.dateCreate!)
                        : '',
                    style: TextStyle(
                      fontSize: SizeConfig(context, 13.0)
                          .getProportionateScreenHeight,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ])),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  alignment: Alignment.topLeft,
                  child: Text(
                    announcement.title ?? '',
                    style: TextStyle(
                      fontSize: SizeConfig(context, 18.0)
                          .getProportionateScreenHeight,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: SvgPicture.asset(
                                  IconLinks.VIEW_COUNT_SVG_LINK,
                                  width: SizeConfig(context, 14.0)
                                      .getProportionateScreenHeight,
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Container(
                                child: Text(
                                  announcement.viewCount != null
                                      ? announcement.viewCount.toString()
                                      : '0',
                                  style: TextStyle(
                                    fontSize: SizeConfig(context, 13.0)
                                        .getProportionateScreenHeight,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            )));
  }
}
