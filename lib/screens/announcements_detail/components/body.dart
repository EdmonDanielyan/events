import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/screens/announcements_detail/components/background.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  final AnnouncementData announcement;

  Body({Key? key,
    required this.announcement
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
          children: [
              Padding(
                child: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        IconLinks.VIEW_COUNT_SVG_LINK,
                        semanticsLabel: 'View Count',
                      ),
                      margin: EdgeInsets.only(right: 6.0),
                    ),
                    Container(
                        child: Text(
                            announcement.viewCount != null
                                ? announcement.viewCount.toString()
                                : '',
                            style: TextStyle(
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)
                        ),
                        margin: EdgeInsets.only(right: 16.0)
                    ),
                    Text(
                        announcement.dateCreate != null
                            ? DateFormat('dd.MM.yyyy')
                              .format(announcement.dateCreate!)
                            : '',
                        style: TextStyle(
                          fontFamily: "Helvetica",
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w200,
                        )
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 20.0, top: 17.0, bottom: 10.0),
              ),
              Container(
                  child: Column(children: [
                    Text(
                      announcement.title ?? '',
                      style: TextStyle(
                        fontSize: 26.0,
                        height: 1.3,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Helvetica",
                      ),
                    )
                  ]),
                  margin: EdgeInsets.symmetric(horizontal: 20.0)
              ),
              Container(
                  child: Divider(
                    thickness: 2.0,
                  ),
                  margin: EdgeInsets.only(top: 16.0, bottom: 11.0)
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Html(data: announcement.detailText ?? '')
              )
          ]
        )
    );
  }
}
