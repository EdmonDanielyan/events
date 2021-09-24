import 'package:ink_mobile/cubit/news_comments/sources/comment/dependency.dart';
import 'package:ink_mobile/cubit/news_comments/sources/comment/network.dart';

class NewsCommentRepository {
  final int? answerId;
  final int newsId;
  final String text;
  NewsCommentRepository(
      {required this.answerId, required this.newsId, required this.text});

  NewsCommentsAddRequestDependency getDependency() {
    return NewsCommentsAddNetworkRequest(
        answerId: answerId, id: newsId, text: text);
  }
}
