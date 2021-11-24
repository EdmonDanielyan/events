import 'package:ink_mobile/models/data.dart';
import 'package:main_api_client/model/announcement_property.dart';

class AnnouncementData extends Data {
  int? id;
  String? title;
  DateTime? dateCreate;
  int? viewCount;
  String? detailText;

  AnnouncementData({
    this.id,
    this.title,
    this.dateCreate,
    this.viewCount,
    this.detailText,
  });

  void fillFromMap(Map map) {
    id = map['id'] is int ? map['id'] : int.tryParse(map['id'].toString());

    title = map['title'] is String ? map['title'] : null;

    viewCount = map['view_count'] is int
        ? map['view_count']
        : int.tryParse(map['view_count'].toString());

    dateCreate = map['date_create'] is String
        ? DateTime.tryParse(map['date_create'])
        : null;

    detailText = map['detail_text'] is String ? map['detail_text'] : null;
  }

  factory AnnouncementData.fromMap(Map map) {
    return AnnouncementData(
      id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()),
      title: map['title'] is String ? map['title'] : null,
      viewCount: map['view_count'] is int
          ? map['view_count']
          : int.tryParse(map['view_count'].toString()),
      dateCreate: map['date_create'] is String
          ? DateTime.tryParse(map['date_create'])
          : null,
      detailText: map['detail_text'] is String ? map['detail_text'] : null,
    );
  }

  factory AnnouncementData.fromProperty(AnnouncementProperty property) {
    return AnnouncementData(
        id: property.id,
        title: property.title,
        viewCount: property.viewCount,
        detailText: property.detailText,
        dateCreate: property.dateCreate);
  }

  static List<AnnouncementData> getListFromMap(List listData) {
    List<AnnouncementData> list = [];

    listData.forEach((element) {
      list.add(AnnouncementData.fromMap(element));
    });

    return list;
  }
}
