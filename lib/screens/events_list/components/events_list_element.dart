import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:share_plus/share_plus.dart';

import '../../../messenger/functions/size_config.dart';
import '../../../messenger/utils/date_functions.dart';

class EventsListElement extends StatelessWidget {
  final EventData event;
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'assets/images/default_event.jpg';

  const EventsListElement({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/event_detail',
            arguments: {'id': event.id});
      },
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: size.width,
              height: SizeConfig(context, 175.0).getProportionateScreenHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: event.pictureLink == null
                  ? Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                      fit: BoxFit.fitWidth)
                  : Image.network(
                      event.pictureLink!,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                            fit: BoxFit.fitWidth);
                      },
                    ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                _getEventTimeAndPlace(),
                style: FontStyles.rubikP2(color: Palette.textBlack50),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                event.title ?? '',
                style: FontStyles.rubikH4(color: Palette.textBlack),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Share.share(
                      'https://portal.irkutskoil.ru/events/${event.id}/');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Поделиться',
                        style:
                            FontStyles.rubikP1Medium(color: Palette.greenE4A),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.share, size: 16, color: Palette.greenE4A),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Divider(
              color: Palette.text20Grey,
            )
          ],
        ),
      ),
    );
  }

  String _getEventTimeAndPlace() {
    List timeAndPlace = [];

    if (event.beginDate != null) {
      timeAndPlace.add(
          "${DateFunctions(passedDate: event.beginDate!).dayMonthYearNumbers()} ${DateFunctions(passedDate: event.beginDate!).hourMinute()}");
    }

    if (event.place != null) {
      timeAndPlace.add(event.place);
    }

    return timeAndPlace.join(', ');
  }
}
