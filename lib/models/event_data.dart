import 'package:ink_mobile/models/data.dart';
import 'package:openapi/openapi.dart';

class EventData extends Data {
  int? id;
  String? title;
  List<DateTime>? dates;
  DateTime? dateStart;
  DateTime? dateFinish;
  String? place;
  int? viewCount;
  String? previewPicture;

  EventData({
    this.id,
    this.title,
    this.dates,
    this.dateStart,
    this.dateFinish,
    this.place,
    this.viewCount,
    this.previewPicture,
  });

  @override
  void fillFromMap(Map map) {
    id = map['id'] is int ? int.tryParse(map['id'].toString()) : null;

    title = map['title'] is String ? map['title'] : null;
    dates = map['dates'] is List<String>
        ? map['dates'].map((date) => DateTime.parse(date)).toList()
        : null;

    dateStart =
        map['dateStart'] is String ? DateTime.tryParse(map['dateStart']) : null;

    dateFinish = map['dateFinish'] is String
        ? DateTime.tryParse(map['dateFinish'])
        : null;

    place = map['place'] is String ? map['place'] : null;

    viewCount = map['viewCount'] is int
        ? map['viewCount']
        : int.tryParse(map['viewCount'].toString());

    previewPicture =
        map['previewPicture'] is String ? map['previewPicture'] : null;
  }

  factory EventData.fromMap(Map map) {
    return EventData(
      id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()),
      title: map['title'] is String ? map['title'] : null,
      dates: map['dates'] is List<String>
          ? map['dates'].map((date) => DateTime.parse(date)).toList()
          : null,
      dateStart: map['dateStart'] is String
          ? DateTime.tryParse(map['dateStart'])
          : null,
      dateFinish: map['dateFinish'] is String
          ? DateTime.tryParse(map['dateFinish'])
          : null,
      place: map['place'] is String ? map['place'] : null,
      viewCount: map['viewCount'] is int
          ? map['viewCount']
          : int.tryParse(map['viewCount'].toString()),
      previewPicture:
          map['previewPicture'] is String ? map['previewPicture'] : null,
    );
  }

  EventData copyWith({
    int? id,
    String? title,
    List<DateTime>? dates,
    DateTime? dateStart,
    DateTime? dateFinish,
    String? place,
    int? viewCount,
    String? previewPicture,
  }) {
    return EventData(
      id: id ?? this.id,
      title: title ?? this.title,
      dates: dates ?? this.dates,
      dateStart: dateStart ?? this.dateStart,
      dateFinish: dateFinish ?? this.dateFinish,
      place: place ?? this.place,
      viewCount: viewCount ?? this.viewCount,
      previewPicture: previewPicture ?? this.previewPicture,
    );
  }

  static List<EventData> getListFromResponse(List eventDataList) {
    List<EventData> list = [];

    for (var element in eventDataList) {
      list.add(EventData.fromMap(element));
    }

    return list;
  }
}



// class EventData extends Data {
//   String? id;
//   String? title;
//   String? place;
//   int? viewCount;
//   List<DateTime>? dates;
//   DateTime? dateStart;
//   DateTime? dateFinish;
//   String? detailText;
//   String? previewPicture;
//   String? detailPicture;
//   String? subId;

//   EventData(
//       {this.id,
//       this.title,
//       this.place,
//       this.viewCount,
//       this.dates,
//       this.dateStart,
//       this.dateFinish,
//       this.detailText,
//       this.previewPicture,
//       this.detailPicture,
//       this.subId});

//   @override
//   void fillFromMap(Map map) {
//     id = map['id'] is int ? map['id'] : int.tryParse(map['id'].toString());

//     title = map['title'] is String ? map['title'] : null;

//     dateStart = map['date_create'] is String
//         ? DateTime.tryParse(map['date_create'])
//         : null;

//     dateFinish = map['date_start'] is String
//         ? DateTime.tryParse(map['date_start'])
//         : null;

//     dates = map['dates'] is List<String>
//         ? map['dates'].map((date) => DateTime.parse(date)).toList()
//         : null;

//     place = map['place'] is String ? map['place'] : null;

//     viewCount = map['view_count'] is int
//         ? map['view_count']
//         : int.tryParse(map['view_count'].toString());

//     previewPicture =
//         map['preview_picture'] is String ? map['detail_picture'] : null;

//     subId = map['detail_picture'] is String ? map['detail_picture'] : null;
//     detailText = map['detail_text'] is String ? map['detail_text'] : null;
//   }

//   factory EventData.fromMap(Map map) {
//     return EventData(
//       id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()),
//       title: map['title'] is String ? map['title'] : null,
//       dates: map['dates'] is List<String>
//           ? map['dates'].map((date) => DateTime.parse(date)).toList()
//           : null,
//       dateStart: map['date_start'] is String
//           ? DateTime.tryParse(map['date_start'])
//           : null,
//       dateFinish: map['date_finish'] is String
//           ? DateTime.tryParse(map['date_finish'])
//           : null,
//       place: map['place'] is String ? map['place'] : null,
//       viewCount: map['view_count'] is int
//           ? map['view_count']
//           : int.tryParse(map['view_count'].toString()),
//       previewPicture:
//           map['preview_picture'] is String ? map['preview_picture'] : null,
//       detailPicture:
//           map['detail_picture'] is String ? map['detail_picture'] : null,
//       detailText: map['detail_text'] is String ? map['detail_text'] : null,
//       subId: map['sub_id'] is String ? map['sub_id'] : null,
//     );
//   }

//   EventData copyWith({
//   int? id;
//   String? title;
//   String? place;
//   int? viewCount;
//   List<DateTime>? dates;
//   DateTime? dateStart;
//   DateTime? dateFinish;
//   String? detailText;
//   String? previewPicture;
//   String? detailPicture;
//   String? subId;
//   }) {
//     return EventData(
//       id: id ?? this.id,
//       title: title ?? this.title,
//             dates: dates ?? this.dates,
//       dateStart: dateStart ?? this.dateStart,
//       dateFinish: dateFinish ?? this.dateFinish,
//       place: place ?? this.place,
//       viewCount: viewCount ?? this.viewCount,
//       detailText: detailText ?? this.detailText,
//       previewPicture: previewPicture ?? this.previewPicture,
//         detailPicture: detailPicture ?? this.detailPicture,
//          subId: subId ?? this.subId,

//     );
//   }

//   factory EventData.fromProperty(EventProperty property) {
//     return EventData(
//       id: property.id,
//       title: property.title,
//       viewCount: property.viewCount,
//       detailText: property.detailText,
//       dateStart: property.dateStart,
//       beginDate: property.dateStart,
//       endDate: property.dateFinish,
//       place: property.place,
//       pictureLink: property.detailPicture,
//       isMember: property.isMember,
//     );
//   }

//   static List<EventData> getListFromResponse(List eventDataList) {
//     List<EventData> list = [];

//     for (var element in eventDataList) {
//       list.add(EventData.fromMap(element));
//     }

//     return list;
//   }
// }
