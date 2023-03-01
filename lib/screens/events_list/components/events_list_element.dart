import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/event_data.dart';

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
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text(
                _getEventTimeAndPlace(),
                style: FontStyles.rubikP2(color: Palette.textBlack50),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                event.title ?? '',
                style: FontStyles.rubikH3(color: Palette.textBlack),
                maxLines: 4,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 8.0,),
            Divider(color: Palette.text20Grey,)
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
