import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/utils/date_functions.dart';
import 'package:ink_mobile/models/event_data.dart';

import '../../../messenger/functions/size_config.dart';

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
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                    width: size.width,
                    clipBehavior: Clip.hardEdge,
                    height:
                        SizeConfig(context, 180.0).getProportionateScreenHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: event.pictureLink == null
                        ? Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                            fit: BoxFit.fitWidth)
                        : Image.network(event.pictureLink!,
                            fit: BoxFit.fitWidth,
                            errorBuilder: (context, error, stackTrace) {
                            return Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                                fit: BoxFit.fitWidth);
                          })),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _getEventTimeAndPlace(),
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: SizeConfig(context, 14.0)
                              .getProportionateScreenHeight,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    event.title ?? '',
                    style: TextStyle(
                      fontSize: SizeConfig(context, 18.0)
                          .getProportionateScreenHeight,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            )));
  }

  String _getEventTimeAndPlace() {
    List timeAndPlace = [];

    if (event.beginDate != null) {
      timeAndPlace.add(
          "${DateFunctions(passedDate: event.beginDate!).dayMonthNumbers()} ${DateFunctions(passedDate: event.beginDate!).hourMinute()}");
    }

    if (event.place != null) {
      timeAndPlace.add(event.place);
    }

    return timeAndPlace.join(', ');
  }
}
