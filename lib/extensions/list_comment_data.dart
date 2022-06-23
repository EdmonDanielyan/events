import 'package:ink_mobile/models/comment_data.dart';

extension ListCommentData on List<CommentData> {
  int countComments() {
    final comments = this;
    int count = comments.length;

    for (final comment in comments) count += (comment.children?.length ?? 0);

    return count;
  }
}
