import 'package:ink_mobile/cubit/news_detail/sources/fetch/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_news_by_id.dart';
import 'package:main_api_client/model/news_property_by_id.dart';

class NewsDetailFetch {
  final NewsDetailRequestDependency dependency;

  NewsDetailFetch({required this.dependency});

  Future<NewsItemData> call() async {
    Response<GetNewsById> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  NewsItemData mapResponse(Response<GetNewsById> response) {
    NewsPropertyById? newsData = response.data?.data;

    if (newsData != null) {
      NewsItemData newsItem = NewsItemData.fromProperty(newsData);

      return newsItem;
    } else {
      throw UnknownErrorException();
    }
  }
}
