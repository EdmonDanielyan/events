import 'package:flutter/material.dart';
import 'package:ink_mobile/models/comment_data.dart';

enum NewsCommentStateType { EMPTY, LOADING, LOADED, ERROR }

class NewsCommentsData {
  List<CommentData>? comments;
  int commentCount;

  NewsCommentsData({required this.comments, required this.commentCount});
}

@immutable
class NewsCommentState {
  final NewsCommentsData? data;
  final NewsCommentStateType type;
  final String? errorMessage;

  NewsCommentState({required this.type, this.data, this.errorMessage})
      : assert(type != NewsCommentStateType.ERROR || errorMessage != null);
}
