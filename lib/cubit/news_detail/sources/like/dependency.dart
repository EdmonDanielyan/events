abstract class NewsLikeRequestDependency {
  abstract int newsId;
  Future<void> makeRequest();
}
