import 'package:dio/dio.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:main_api_client/model/feedback_tags_list.dart';

extension FeedbackTagsListExt on Response<FeedbackTagsList> {
  List<Selectfield> mapResponse() {
    List<Selectfield> items = [];

    this.data?.data.forEach((item) {
      items.add(
        Selectfield(id: item.id, title: item.title),
      );
    });

    return items;
  }
}