import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/utils/date_functions.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:share_plus/share_plus.dart';

import '../../../messenger/functions/size_config.dart';

class EventsListElement extends StatelessWidget {
  final EventData event;
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'assets/images/default_event.jpg';

  const EventsListElement({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/event_detail',
            arguments: {'id': event.id});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: SizeConfig(context, 180.0).getProportionateScreenHeight,
              child: event.pictureLink == null
                  ? Image.asset(DEFAULT_PREVIEW_PICTURE_LINK, fit: BoxFit.fill)
                  : Image.network(
                      event.pictureLink!,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                            fit: BoxFit.fill);
                      },
                    ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _getEventTimeAndPlace(),
            style: FontStyles.rubikP2(color: Palette.textBlack50),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            event.title ?? '',
            style: FontStyles.rubikH4(color: Palette.textBlack),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
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
          ),
        ],
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
