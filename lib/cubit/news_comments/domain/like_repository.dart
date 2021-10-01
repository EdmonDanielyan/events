import 'package:ink_mobile/cubit/news_comments/sources/like/dependency.dart';
import 'package:ink_mobile/cubit/news_comments/sources/like/network.dart';

class NewsCommentsLikeRepository {
  final int commentId;
  NewsCommentsLikeRepository({required this.commentId});

  NewsCommentsLikeRequestDependency getDependency() {
    return NewsCommentsLikeNetworkRequest(commentId: commentId);
  }
}
