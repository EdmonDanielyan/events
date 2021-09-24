import 'package:ink_mobile/cubit/news_comments/sources/fetch/dependency.dart';
import 'package:ink_mobile/cubit/news_comments/sources/fetch/network.dart';

class NewsCommentsFetchRepository {
  final int newsId;
  NewsCommentsFetchRepository({required this.newsId});

  NewsCommentsFetchRequestDependency getDependency() {
    return NewsCommentsFetchNetworkRequest(newsId: newsId);
  }
}
