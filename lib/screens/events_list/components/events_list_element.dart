import 'package:flutter/material.dart';
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
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xffe5e5e5)))),
            child: Column(children: [
              Container(
                  width: size.width,
                  height:
                      SizeConfig(context, 175.0).getProportionateScreenHeight,
                  child: event.pictureLink == null
                      ? Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                          fit: BoxFit.fitWidth)
                      : Image.network(event.pictureLink!, fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) {
                          return Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                              fit: BoxFit.fitWidth);
                        })),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _getEventTimeAndPlace(),
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontSize: SizeConfig(context, 13.0)
                                  .getProportionateScreenHeight,
                            ),
                            textAlign: TextAlign.start,
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          alignment: Alignment.topLeft,
                          child: Text(
                            event.title ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig(context, 18.0)
                                  .getProportionateScreenHeight,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 4,
                            textAlign: TextAlign.start,
                          )),
                    ],
                  ))
            ])));
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
