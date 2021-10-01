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
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                    width: size.width,
                    clipBehavior: Clip.hardEdge,
                    height: 200,
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
                            fontSize: 16),
                        textAlign: TextAlign.start,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    event.title ?? '',
                    style: TextStyle(
                      fontSize: 20,
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
