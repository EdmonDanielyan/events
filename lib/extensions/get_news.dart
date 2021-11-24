import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:main_api_client/model/get_news.dart';

extension GetNewsExt on Response<GetNews> {
  Pagination<NewsItemData> mapResponse(Pagination<NewsItemData> pagination) {
    Map? list = this.data?.data.asMap;

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
