// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:openapi/openapi.dart';

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
