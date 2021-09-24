import 'package:ink_mobile/cubit/news_list/sources/dependency.dart';
import 'package:ink_mobile/cubit/news_list/sources/network.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';

class NewsListRepository {
  final String filter;
  final Pagination<NewsItemData> pagination;
  NewsListRepository({required this.pagination, required this.filter});

  NewsListRequestDependency getDependency() {
    return NewsListNetworkRequest(
      pagination: pagination,
      filter: filter,
    );
  }
}
