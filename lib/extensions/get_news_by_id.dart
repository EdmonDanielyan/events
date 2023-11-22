import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:openapi/openapi.dart';

extension GetNewsByIdExt on Response<GetNewsById> {
  NewsItemData mapResponse() {
    NewsPropertyById? newsData = data?.data;

    if (newsData != null) {
      NewsItemData newsItem = NewsItemData.fromProperty(newsData);

      return newsItem;
    } else {
      throw UnknownErrorException();
    }
  }
}
