abstract class NewsCommentsLikeRequestDependency {
  abstract int commentId;
  Future<void> makeRequest();
}
