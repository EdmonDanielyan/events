import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:main_api_client/model/get_news_by_id.dart';
import 'package:main_api_client/model/news_property_by_id.dart';

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
