import 'package:ink_mobile/cubit/news_comments/sources/like/dependency.dart';

class NewsCommentsLike {
  final NewsCommentsLikeRequestDependency dependency;

  NewsCommentsLike({required this.dependency});

  Future<void> like() async => await dependency.makeRequest();
}
