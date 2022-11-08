import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/cubit/announcements_list/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/screens/announcements_detail/components/background.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  final AnnouncementData announcement;
  final MainAnnouncementsListCubit mainAnnouncementsListCubit;
  final AnnouncementsListCubit announcementsListCubit;

  const Body(
      {Key? key,
      required this.announcement,
      required this.announcementsListCubit,
      required this.mainAnnouncementsListCubit})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _updateMainAnnouncementListCubit() {
    widget.mainAnnouncementsListCubit.updateItem(widget.announcement);
  }

  void _updateAnnouncementListCubit() {
    widget.announcementsListCubit.updateItem(widget.announcement);
  }

  @override
  void initState() {
    super.initState();

    _updateMainAnnouncementListCubit();
    _updateAnnouncementListCubit();
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayoutBuilder(
      builder: (context, constraints, isTablet) {
        return Background(
          child: Column(
            children: [
              Padding(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        IconLinks.VIEW_COUNT_SVG_LINK,
                        semanticsLabel: 'View Count',
                        width: isTablet ? 30 : null,
                        height: isTablet ? 30 : null,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Container(
                        child: Text(
                          widget.announcement.viewCount != null
                              ? widget.announcement.viewCount.toString()
                              : '',
                          style: TextStyle(
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: SizeConfig(context, 14)
                                  .getProportionateScreenHeight),
                        ),
                        margin: EdgeInsets.only(right: 16.0)),
                    Text(
                      widget.announcement.dateCreate != null
                          ? DateFormat('dd.MM.yyyy')
                              .format(widget.announcement.dateCreate!)
                          : '',
                      style: TextStyle(
                        fontFamily: "Helvetica",
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w200,
                        fontSize: SizeConfig(context, 12)
                            .getProportionateScreenHeight,
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 20.0, top: 17.0, bottom: 10.0),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      widget.announcement.title ?? '',
                      style: TextStyle(
                        fontSize: SizeConfig(context, 21)
                            .getProportionateScreenHeight,
                        height: 1.3,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Helvetica",
                      ),
                    )
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
              ),
              Container(
                child: Divider(
                  thickness: 2.0,
                ),
                margin: EdgeInsets.only(top: 16.0, bottom: 11.0),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: CustomHtml(
                  data: widget.announcement.detailText ?? '',
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
