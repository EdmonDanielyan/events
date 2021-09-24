import 'package:ink_mobile/cubit/news_detail/sources/like/dependency.dart';

class NewsDetailLike {
  final NewsLikeRequestDependency dependency;

  NewsDetailLike({required this.dependency});

  Future<void> like() async => dependency.makeRequest();
}
