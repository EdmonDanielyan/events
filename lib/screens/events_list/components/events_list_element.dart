import 'package:flutter/material.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:intl/intl.dart';

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
                  height: 191,
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
                                color: Theme.of(context).iconTheme.color),
                            textAlign: TextAlign.start,
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          alignment: Alignment.topLeft,
                          child: Text(
                            event.title ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
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
    String timeRange = '';
    List timeAndPlace = [];

    if (event.dateCreate != null) {
      timeAndPlace.add(DateFormat('dd.MM.yyyy').format(event.dateCreate!));
    }

    if (event.beginDate != null && event.endDate != null) {
      timeRange = DateFormat('HH:mm').format(event.beginDate!) +
          ' - ' +
          DateFormat('HH:mm').format(event.endDate!);
      timeAndPlace.add(timeRange);
    }

    if (event.place != null) {
      timeAndPlace.add(event.place);
    }

    return timeAndPlace.join(', ');
  }
}
