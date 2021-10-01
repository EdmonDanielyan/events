import 'package:ink_mobile/cubit/news_detail/sources/fetch/dependency.dart';
import 'package:ink_mobile/cubit/news_detail/sources/fetch/network.dart';

class NewsDetailFetchRepository {
  final int newsId;
  NewsDetailFetchRepository({required this.newsId});

  NewsDetailRequestDependency getDependency() {
    return NewsDetailNetworkRequest(newsId: newsId);
  }
}
