// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:ink_mobile/models/data.dart';
import 'package:openapi/openapi.dart';


class NewsItemData extends Data {
  int? id;
  String? title;
  DateTime? dateCreate;
  int? likeCount;
  int? commentCount;
  int? viewCount;
  String? detailText;
  bool? isLiked;
  String? previewPictureLink;
  List<String?>? detailPictureLinks;
  List<String?>? videoLinks;
  // migration
  // List<String>? detailPictureLinks;
  // List<String>? videoLinks;

  NewsItemData({
    this.id,
    this.title,
    this.dateCreate,
    this.likeCount,
    this.commentCount,
    this.viewCount,
    this.detailText,
    this.isLiked,
    this.previewPictureLink,
    this.detailPictureLinks,
    this.videoLinks,
  });

  void fillFromMap(Map map) {
    id = map['id'] is int ? map['id'] : int.tryParse(map['id'].toString());

    title = map['title'] is String ? map['title'] : null;

    dateCreate = map['date_create'] is String
        ? DateTime.tryParse(map['date_create'])
        : null;

    likeCount = map['like_count'] is int
        ? map['like_count']
        : int.tryParse(map['like_count'].toString());

    commentCount = map['comment_count'] is int
        ? map['comment_count']
        : int.tryParse(map['comment_count'].toString());

    viewCount = map['view_count'] is int
        ? map['view_count']
        : int.tryParse(map['view_count'].toString());

    detailText = map['detail_text'] is String ? map['detail_text'] : null;

    isLiked = map['liked'] is bool ? map['liked'] : null;

    previewPictureLink =
        map['preview_picture'] is String ? map['preview_picture'] : null;

    detailPictureLinks = map['image_links'] as List<String>;

    videoLinks = map['videos_links'] as List<String>;
  }

  factory NewsItemData.fromMap(Map map) {
    return NewsItemData(
        id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()),
        title: map['title'] is String ? map['title'] : null,
        dateCreate: map['date_create'] is String
            ? DateTime.tryParse(map['date_create'])
            : null,
        likeCount: map['like_count'] is int
            ? map['like_count']
            : int.tryParse(map['like_count'].toString()),
        commentCount: map['comment_count'] is int
            ? map['comment_count']
            : int.tryParse(map['comment_count'].toString()),
        viewCount: map['view_count'] is int
            ? map['view_count']
            : int.tryParse(map['view_count'].toString()),
        detailText: map['detail_text'] is String ? map['detail_text'] : null,
        isLiked: map['liked'] is bool ? map['liked'] : null,
        previewPictureLink:
            map['preview_picture'] is String ? map['preview_picture'] : null,
        detailPictureLinks: map['image_links'] as List<String>?,
        videoLinks: map['videos_links'] as List<String>?);
  }

  NewsItemData copyWith({
    int? id,
    String? title,
    DateTime? dateCreate,
    int? likeCount,
    int? commentCount,
    int? viewCount,
    String? detailText,
    bool? isLiked,
    String? previewPictureLink,
    List<String>? detailPictureLinks,
    List<String>? videoLinks,
  }) {
    return NewsItemData(
      id: id ?? this.id,
      title: title ?? this.title,
      dateCreate: dateCreate ?? this.dateCreate,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      viewCount: viewCount ?? this.viewCount,
      detailText: detailText ?? this.detailText,
      isLiked: isLiked ?? this.isLiked,
      previewPictureLink: previewPictureLink ?? this.previewPictureLink,
      detailPictureLinks: detailPictureLinks ?? this.detailPictureLinks,
      videoLinks: videoLinks ?? this.videoLinks,
    );
  }

  factory NewsItemData.fromProperty(NewsPropertyById property) {
    return new NewsItemData(
      id: property.id,
      title: property.title,
      viewCount: property.viewCount,
      commentCount: property.commentCount,
      likeCount: property.likeCount,
      dateCreate: property.dateCreate,
      detailText: property.detailText,
      isLiked: property.liked,
      detailPictureLinks: property.imageLinks?.asList() ,
      videoLinks: property.videoLinks?.asList()
    );
  }

  static List<NewsItemData> getListFromResponse(List listData) {
    List<NewsItemData> list = [];

    listData.forEach((element) {
      list.add(NewsItemData.fromMap(element));
    });

    return list;
  }
}
