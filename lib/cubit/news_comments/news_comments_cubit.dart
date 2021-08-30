import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/comment_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/news_api.dart';
import 'package:main_api_client/model/get_comments_by_id.dart';
import 'package:main_api_client/model/post_comment.dart';
import 'news_comments_state.dart';
import 'package:ink_mobile/models/error_response.dart';

class NewsCommentsCubit extends Cubit<NewsCommentState> {
  MainApiClient api;
  TextEditingController commentInputController = TextEditingController();
  FocusNode focusNode = FocusNode();
  int? answerId;

  NewsCommentsCubit({
    required this.api
  }) : super (NewsCommentState(type: NewsCommentStateType.LOADING));

  Future<void> load(int newsId) async {

    try {
      await Token.setNewTokensIfExpired();
      NewsApi newsApi = this.api.getNewsApi();
      Response<GetCommentsById> response =
        await newsApi.newsCommentsIdGet(newsId);

      List<CommentData> comments = [];
      int commentCount = 0;

      response.data?.data.forEach((comment) {
        List<CommentData> commentsChildren = [];

        if (comment.children.length > 0) {
          comment.children.forEach((commentChildren) {
            commentsChildren.add(CommentData(
                newsId: newsId,
                id: commentChildren.id,
                pathToAvatar: commentChildren.avatar,
                authorName: commentChildren.userName,
                comment: commentChildren.postText,
                barrels: commentChildren.likes,
                barrelsChecked: commentChildren.likedByUser,
                timeCreate: commentChildren.dateCreate
            ));
            commentCount++;
          });
        }

        comments.add(CommentData(
            newsId: newsId,
            id: comment.id,
            pathToAvatar: comment.avatar,
            authorName: comment.userName,
            comment: comment.postText,
            timeCreate: comment.dateCreate,
            barrels: comment.likes,
            barrelsChecked: comment.likedByUser,
            children: commentsChildren,
        ));
        commentCount++;
      });

      emitState(
        type: NewsCommentStateType.LOADED,
        data: NewsCommentsData(
            comments: comments,
            commentCount: commentCount
        )
      );
    }  on DioError catch (e) {

      switch (e.type) {
        case DioErrorType.other: {
          emitState(
              type: NewsCommentStateType.ERROR,
              errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
          );
          throw NoConnectionException();
        }

        case DioErrorType.response: {
          ErrorResponse response =
            ErrorResponse.fromException(e);

          if (response.code == 'QMA-29') {
            emitState(
              type: NewsCommentStateType.EMPTY,
            );
          } else {
            emitState(
              type: NewsCommentStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
            );
          }

          break;
        }

        default: {
          emitState(
              type: NewsCommentStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );

          break;
        }
      }

    } on Exception catch (e) {
      emitState(
        type: NewsCommentStateType.ERROR,
        errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
    }
  }

  Future<void> addComment(int newsId) async {
    try {
      await Token.setNewTokensIfExpired();
      PostCommentBuilder commentBuilder = PostCommentBuilder();

      commentBuilder.text = this.commentInputController.text;
      commentBuilder.newsId = newsId;

      if (this.answerId != null) {
        commentBuilder.parentId = this.answerId;
      }

      PostComment commentParams = commentBuilder.build();

      await api
          .getNewsApi()
          .newsPostcommentPost(postComment: commentParams)
          .timeout(Duration(seconds: 4));

      this.answerId = null;
      this.commentInputController.text = '';

      emitState(type: NewsCommentStateType.LOADING);
      return;

    } on DioError catch (e) {

      if (e.type == DioErrorType.other) {
        throw NoConnectionException();
      }

    } on TimeoutException catch (e) {
      throw NoConnectionException();
    }
  }

  Future<bool> like(int commentId) async {
    try {
      await Token.setNewTokensIfExpired();
      await api.getNewsApi().newsCommentsLikeIdGet(commentId);
      return true;
    } catch (e) {
      throw UnknownErrorException();
    }
  }

  void refresh() {
    emitState(type: NewsCommentStateType.LOADING);
  }

  void emitState({
    required NewsCommentStateType type,
    NewsCommentsData? data,
    String? errorMessage
  }) {
    emit(NewsCommentState(
        type: type,
        data: data,
        errorMessage: errorMessage
    ));
  }

}