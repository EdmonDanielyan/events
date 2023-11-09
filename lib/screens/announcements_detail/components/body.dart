import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/announcements_list/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.announcement.dateCreate != null
                          ? DateFormat('dd.MM.yyyy')
                              .format(widget.announcement.dateCreate!)
                          : '',
                      style: FontStyles.rubikP2(color: Palette.textBlack50),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      IconLinks.OPENED_EYE_ICON_LINK,
                      semanticsLabel: 'View Count',
                      height: 16.0,
                      width: 16.0,
                      color: Palette.textBlack50,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      (widget.announcement.viewCount ?? 0).toString(),
                      style: FontStyles.rubikP2(color: Palette.textBlack50),
                    ),
                  ],
                ),
              ),
              Text(
                widget.announcement.title ?? '',
                style: FontStyles.rubikH3(color: Palette.textBlack),
              ),
              const Divider(
                thickness: 2.0,
                height: 48.0,
              ),
              CustomHtml(
                data: widget.announcement.detailText ?? '',
              ),
              const SizedBox(height: 15),
              DefaultButton(
                title: 'Поделиться',
                onTap: () {
                  Share.share(
                      'https://portal.irkutskoil.ru/announcements/${widget.announcement.id}/');
                },
                buttonColor: Palette.transparent,
                borderColor: Palette.greenE4A,
                textColor: Palette.greenE4A,
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
