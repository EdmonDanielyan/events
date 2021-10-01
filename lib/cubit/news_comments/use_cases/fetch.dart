import 'package:ink_mobile/cubit/news_comments/sources/fetch/dependency.dart';
import 'package:ink_mobile/models/comment_data.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_comments_by_id.dart';

class NewsCommentsFetch {
  final int id;

  final NewsCommentsFetchRequestDependency dependency;

  NewsCommentsFetch({required this.dependency, required this.id});

  Future<List<CommentData>> call() async {
    Response<GetCommentsById> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  List<CommentData> mapResponse(Response<GetCommentsById> response) {
    List<CommentData> comments = [];

    response.data?.data.forEach((comment) {
      List<CommentData> commentsChildren = [];

      if (comment.children.length > 0) {
        comment.children.forEach((commentChildren) {
          commentsChildren.add(CommentData(
              newsId: id,
              id: commentChildren.id,
              pathToAvatar: commentChildren.avatar,
              authorName: commentChildren.userName,
              comment: commentChildren.postText,
              barrels: commentChildren.likes,
              barrelsChecked: commentChildren.likedByUser,
              timeCreate: commentChildren.dateCreate));
        });
      }

      comments.add(CommentData(
        newsId: id,
        id: comment.id,
        pathToAvatar: comment.avatar,
        authorName: comment.userName,
        comment: comment.postText,
        timeCreate: comment.dateCreate,
        barrels: comment.likes,
        barrelsChecked: comment.likedByUser,
        children: commentsChildren,
      ));
    });

    return comments;
  }
}
