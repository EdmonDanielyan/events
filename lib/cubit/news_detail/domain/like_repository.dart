import 'package:ink_mobile/cubit/news_detail/sources/like/dependency.dart';
import 'package:ink_mobile/cubit/news_detail/sources/like/network.dart';

class NewsDetailLikeRepository {
  final int newsId;
  NewsDetailLikeRepository({required this.newsId});

  NewsLikeRequestDependency getDependency() {
    return NewsLikeNetworkRequest(newsId: newsId);
  }
}
