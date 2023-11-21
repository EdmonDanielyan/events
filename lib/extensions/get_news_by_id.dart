// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:openapi/openapi.dart';

extension GetNewsByIdExt on Response<GetNewsById> {
  NewsItemData mapResponse() {
    NewsPropertyById? newsData = this.data?.data;

    if (newsData != null) {
      NewsItemData newsItem = NewsItemData.fromProperty(newsData);

      return newsItem;
    } else {
      throw UnknownErrorException();
    }
  }
}
