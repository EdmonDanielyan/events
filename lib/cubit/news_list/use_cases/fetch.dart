import 'package:ink_mobile/cubit/news_list/sources/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_news.dart';

class NewsListFetch {
  final NewsListRequestDependency dependency;
  Pagination<NewsItemData> pagination;

  NewsListFetch({required this.dependency, required this.pagination});

  Future<Pagination<NewsItemData>> call() async {
    Response<GetNews> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  Pagination<NewsItemData> mapResponse(Response<GetNews> response) {
    Map? list = response.data?.data.asMap;

    if (list != null) {
      final _newList = List<NewsItemData>.from(pagination.items)
        ..addAll(NewsItemData.getListFromResponse(list['news']));

      pagination = pagination.copyWith(items: _newList);

      if (list['next'] == null) {
        pagination.next = false;
      }

      pagination.pageNumber++;

      return pagination;
    } else {
      throw UnknownErrorException();
    }
  }
}
