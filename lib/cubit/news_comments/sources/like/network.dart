import 'package:main_api_client/api.dart';

import 'dependency.dart';

class NewsCommentsLikeNetworkRequest extends NewsCommentsLikeRequestDependency {
  int commentId;
  NewsCommentsLikeNetworkRequest({required this.commentId});

  @override
  Future<void> makeRequest() async {
    await MainApiClient().getNewsApi().newsCommentsLikeIdGet(commentId);
  }
}
