import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/news_comments/domain/fetch_repository.dart';
import 'package:ink_mobile/cubit/news_comments/use_cases/comment.dart';
import 'package:ink_mobile/cubit/news_comments/use_cases/fetch.dart';
import 'package:ink_mobile/cubit/news_comments/use_cases/like.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/comment_data.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'domain/comment_repository.dart';
import 'domain/like_repository.dart';
import 'news_comments_state.dart';

class NewsCommentsCubit extends Cubit<NewsCommentState> {
  LanguageStrings languageStrings;
  TextEditingController commentInputController = TextEditingController();
  FocusNode focusNode = FocusNode();
  int? answerId;

  NewsCommentsCubit({required this.languageStrings})
      : super(NewsCommentState(type: NewsCommentStateType.LOADING));

  Future<void> load(int newsId) async {
    try {
      await Token.setNewTokensIfExpired();
      List<CommentData> comments = await NewsCommentsFetch(
        id: newsId,
        dependency: NewsCommentsFetchRepository(newsId: newsId).getDependency(),
      ).call();
      emitSuccess(comments);
    } on DioError catch (e) {
      final _errorHandler =
          DioErrorHandler(e: e, languageStrings: languageStrings);
      if (_errorHandler.isEmpty()) {
        emitEmpty();
        return;
      }

      ErrorModel error = _errorHandler.call();
      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(languageStrings.errorOccuried);
    }
  }

  Future<void> addComment(int newsId) async {
    try {
      await Token.setNewTokensIfExpired();
      await NewsCommentsAdd(
        dependency: NewsCommentRepository(
          answerId: answerId,
          newsId: newsId,
          text: commentInputController.text,
        ).getDependency(),
      ).comment();
      clear();
      emitState(type: NewsCommentStateType.LOADING);
      return;
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) throw NoConnectionException();
    } on TimeoutException catch (_) {
      throw NoConnectionException();
    }
  }

  Future<bool> like(int commentId) async {
    try {
      await Token.setNewTokensIfExpired();
      await NewsCommentsLike(
        dependency:
            NewsCommentsLikeRepository(commentId: commentId).getDependency(),
      ).like();
      return true;
    } catch (e) {
      throw UnknownErrorException();
    }
  }

  void clear() {
    answerId = null;
    commentInputController.text = '';
  }

  void refresh() {
    emitState(type: NewsCommentStateType.LOADING);
  }

  void emitSuccess(List<CommentData> comments) {
    emitState(
      type: NewsCommentStateType.LOADED,
      data: NewsCommentsData(
        comments: comments,
        commentCount: CommentDataListView.countComment(comments),
      ),
    );
  }

  void emitError(String errorMsg) {
    emitState(
      type: NewsCommentStateType.ERROR,
      errorMessage: errorMsg,
    );
  }

  void emitEmpty() {
    emitState(type: NewsCommentStateType.EMPTY);
  }

  void emitState(
      {required NewsCommentStateType type,
      NewsCommentsData? data,
      String? errorMessage}) {
    emit(NewsCommentState(type: type, data: data, errorMessage: errorMessage));
  }
}
