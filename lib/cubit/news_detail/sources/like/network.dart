import 'package:main_api_client/api.dart';

import 'dependency.dart';

class NewsLikeNetworkRequest extends NewsLikeRequestDependency {
  int newsId;
  NewsLikeNetworkRequest({required this.newsId});

  @override
  Future<void> makeRequest() async {
    await MainApiClient().getNewsApi().newsLikeIdGet(newsId);
  }
}
