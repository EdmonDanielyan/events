// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/models/comment_data.dart';
import 'package:openapi/openapi.dart';

extension GetCommentsByIdExt on Response<GetCommentsById> {
  List<CommentData> mapResponse(int id) {
    List<CommentData> comments = [];

    this.data?.data?.forEach((comment) {
      List<CommentData> commentsChildren = [];

      if (comment.children!.length > 0) {
        comment.children?.forEach((commentChildren) {
          commentsChildren.add(CommentData(
              newsId: id,
              id: commentChildren.id,
              pathToAvatar: commentChildren.avatar,
              authorName: commentChildren.userName,
              authorLastName: commentChildren.userLastName,
              comment: commentChildren.postText,
              barrels: commentChildren.likes ?? 0,
              barrelsChecked: commentChildren.likedByUser ?? false,
              timeCreate: commentChildren.dateCreate.toLocal(),
              authorId: commentChildren.authorId));
        });
      }

      comments.add(CommentData(
          newsId: id,
          id: comment.id,
          pathToAvatar: comment.avatar,
          authorName: comment.userName,
          authorLastName: comment.userLastName,
          comment: comment.postText,
          timeCreate: comment.dateCreate.toLocal(),
          barrels: comment.likes ?? 0,
          barrelsChecked: comment.likedByUser ?? false,
          children: commentsChildren,
          authorId: comment.authorId));
    });

    return comments;
  }
}

// TODO: migration
// extension GetCommentsByIdExt on Response<GetCommentsById> {
//   List<CommentData> mapResponse(int id) {
//     List<CommentData> comments = [];

//     this.data?.data.forEach((comment) {
//       List<CommentData> commentsChildren = [];

//       if (comment.children.length > 0) {
//         comment.children.forEach((commentChildren) {
//           commentsChildren.add(CommentData(
//               newsId: id,
//               id: commentChildren.id,
//               pathToAvatar: commentChildren.avatar,
//               authorName: commentChildren.userName,
//               authorLastName: commentChildren.userLastName,
//               comment: commentChildren.postText,
//               barrels: commentChildren.likes,
//               barrelsChecked: commentChildren.likedByUser,
//               timeCreate: commentChildren.dateCreate.toLocal(),
//               authorId: commentChildren.authorId));
//         });
//       }

//       comments.add(CommentData(
//           newsId: id,
//           id: comment.id,
//           pathToAvatar: comment.avatar,
//           authorName: comment.userName,
//           authorLastName: comment.userLastName,
//           comment: comment.postText,
//           timeCreate: comment.dateCreate.toLocal(),
//           barrels: comment.likes,
//           barrelsChecked: comment.likedByUser,
//           children: commentsChildren,
//           authorId: comment.authorId));
//     });

//     return comments;
//   }
// }
