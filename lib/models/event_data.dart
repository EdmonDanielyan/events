import 'package:ink_mobile/models/data.dart';
import 'package:openapi/openapi.dart';

// class EventData extends Data {
//   int? id;
//   String? title;
//   List<DateTime>? dates;
//   DateTime? dateStart;
//   DateTime? dateFinish;
//   String? place;
//   int? viewCount;
//   String? previewPicture;

//   EventData({
//     this.id,
//     this.title,
//     this.dates,
//     this.dateStart,
//     this.dateFinish,
//     this.place,
//     this.viewCount,
//     this.previewPicture,
//   });

//   @override
//   void fillFromMap(Map map) {
//     id = map['id'] is int ? int.tryParse(map['id'].toString()) : null;

//     title = map['title'] is String ? map['title'] : null;
//     dates = map['dates'] is List<String>
//         ? map['dates'].map((date) => DateTime.parse(date)).toList()
//         : null;

//     dateStart =
//         map['dateStart'] is String ? DateTime.tryParse(map['dateStart']) : null;

//     dateFinish = map['dateFinish'] is String
//         ? DateTime.tryParse(map['dateFinish'])
//         : null;

//     place = map['place'] is String ? map['place'] : null;

//     viewCount = map['viewCount'] is int
//         ? map['viewCount']
//         : int.tryParse(map['viewCount'].toString());

//     previewPicture =
//         map['previewPicture'] is String ? map['previewPicture'] : null;
//   }

//   factory EventData.fromMap(Map map) {
//     return EventData(
//       id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()),
//       title: map['title'] is String ? map['title'] : null,
//       dates: map['dates'] is List<String>
//           ? map['dates'].map((date) => DateTime.parse(date)).toList()
//           : null,
//       dateStart: map['dateStart'] is String
//           ? DateTime.tryParse(map['dateStart'])
//           : null,
//       dateFinish: map['dateFinish'] is String
//           ? DateTime.tryParse(map['dateFinish'])
//           : null,
//       place: map['place'] is String ? map['place'] : null,
//       viewCount: map['viewCount'] is int
//           ? map['viewCount']
//           : int.tryParse(map['viewCount'].toString()),
//       previewPicture:
//           map['previewPicture'] is String ? map['previewPicture'] : null,
//     );
//   }

//   EventData copyWith({
//     int? id,
//     String? title,
//     List<DateTime>? dates,
//     DateTime? dateStart,
//     DateTime? dateFinish,
//     String? place,
//     int? viewCount,
//     String? previewPicture,
//   }) {
//     return EventData(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       dates: dates ?? this.dates,
//       dateStart: dateStart ?? this.dateStart,
//       dateFinish: dateFinish ?? this.dateFinish,
//       place: place ?? this.place,
//       viewCount: viewCount ?? this.viewCount,
//       previewPicture: previewPicture ?? this.previewPicture,
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

class EventData extends Data {
  int? id;
  String? title;
  DateTime? dateCreate;
  DateTime? beginDate;
  DateTime? endDate;
  String? place;
  int? viewCount;
  String? detailText;
  String? pictureLink;
  bool? isMember;
  bool? isActual;
  bool? placesAvailable;

  EventData(
      {this.id,
      this.title,
      this.dateCreate,
      this.beginDate,
      this.endDate,
      this.place,
      this.viewCount,
      this.detailText,
      this.pictureLink,
      this.isMember,
      this.isActual,
      this.placesAvailable});

  @override
  void fillFromMap(Map map) {
    id = map['id'] is int ? map['id'] : int.tryParse(map['id'].toString());

    title = map['title'] is String ? map['title'] : null;

    dateCreate = map['date_create'] is String
        ? DateTime.tryParse(map['date_create'])
        : null;

    beginDate = map['date_start'] is String
        ? DateTime.tryParse(map['date_start'])
        : null;

    endDate = map['date_finish'] is String
        ? DateTime.tryParse(map['date_finish'])
        : null;

    place = map['place'] is String ? map['place'] : null;

    viewCount = map['view_count'] is int
        ? map['view_count']
        : int.tryParse(map['view_count'].toString());

    pictureLink = map['detail_picture'] is int
        ? map['detail_picture']
        : int.tryParse(map['detail_picture'].toString());

    isMember = map['is_member'] is bool ? map['is_member'] : null;
    isActual = map['is_actual'] is bool ? map['is_actual'] : null;
    placesAvailable =
        map['places_available'] is bool ? map['places_available'] : null;
  }

  factory EventData.fromMap(Map map) {
    return EventData(
      id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()),
      title: map['title'] is String ? map['title'] : null,
      dateCreate: map['date_create'] is String
          ? DateTime.tryParse(map['date_create'])
          : null,
      beginDate: map['date_start'] is String
          ? DateTime.tryParse(map['date_start'])
          : null,
      endDate: map['date_finish'] is String
          ? DateTime.tryParse(map['date_finish'])
          : null,
      place: map['place'] is String ? map['place'] : null,
      viewCount: map['view_count'] is int
          ? map['view_count']
          : int.tryParse(map['view_count'].toString()),
      pictureLink:
          map['preview_picture'] is String ? map['preview_picture'] : null,
      isMember: map['is_member'] is bool ? map['is_member'] : null,
      isActual: map['is_actual'] is bool ? map['is_actual'] : null,
      placesAvailable:
          map['places_available'] is bool ? map['places_available'] : null,
    );
  }

  EventData copyWith({
    int? id,
    String? title,
    DateTime? dateCreate,
    DateTime? beginDate,
    DateTime? endDate,
    String? place,
    int? viewCount,
    String? detailText,
    String? pictureLink,
    bool? isMember,
    bool? isActual,
    bool? placesAvailable,
  }) {
    return EventData(
      id: id ?? this.id,
      title: title ?? this.title,
      dateCreate: dateCreate ?? this.dateCreate,
      beginDate: beginDate ?? this.beginDate,
      endDate: endDate ?? this.endDate,
      place: place ?? this.place,
      viewCount: viewCount ?? this.viewCount,
      detailText: detailText ?? this.detailText,
      pictureLink: pictureLink ?? this.pictureLink,
      isMember: isMember ?? this.isMember,
      isActual: isActual ?? this.isActual,
      placesAvailable: placesAvailable ?? this.placesAvailable,
    );
  }

  factory EventData.fromProperty(EventProperty property) {
    return EventData(
      id: property.id,
      title: property.title,
      viewCount: property.viewCount,
      detailText: property.detailText,
      dateCreate: property.dateCreate,
      beginDate: property.dateStart,
      endDate: property.dateFinish,
      place: property.place,
      pictureLink: property.detailPicture,
      isMember: property.isMember,
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
