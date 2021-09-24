import 'package:ink_mobile/cubit/news_comments/sources/comment/dependency.dart';

class NewsCommentsAdd {
  final NewsCommentsAddRequestDependency dependency;

  NewsCommentsAdd({required this.dependency});

  Future<void> comment() async => await dependency.makeRequest();
}
