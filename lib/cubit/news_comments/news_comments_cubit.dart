import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/news_comments/sources/comment/network.dart';
import 'package:ink_mobile/cubit/news_comments/sources/fetch/network.dart';
import 'package:ink_mobile/cubit/news_comments/sources/like/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/comment_data.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/new_comment_entities.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'news_comments_state.dart';
import 'package:ink_mobile/extensions/get_comments_by_id.dart';
import 'package:ink_mobile/extensions/list_comment_data.dart';

@injectable
class NewsCommentsCubit extends Cubit<NewsCommentState> {
  TextEditingController commentInputController = TextEditingController();
  FocusNode focusNode = FocusNode();
  int? answerId;

  NewsCommentsCubit()
      : super(NewsCommentState(type: NewsCommentStateType.LOADING));

  Future<void> load(int newsId) async {
    try {
      await Token.setNewTokensIfExpired();
      final response =
          await getIt<NewsCommentsFetchNetworkRequest>(param1: newsId)();
      List<CommentData> comments = response.mapResponse(newsId);
      emitSuccess(comments);
    } on DioError catch (e) {
      final _errorHandler = DioErrorHandler(e: e);
      if (_errorHandler.isEmpty()) {
        emitEmpty();
        return;
      }

      ErrorModel error = _errorHandler.call();
      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
    }
  }

  Future<void> addComment(int newsId) async {
    try {
      final commentStr = commentInputController.text;
      commentInputController.text = "";
      await Token.setNewTokensIfExpired();
      final comment =
          NewCommentEntities(id: newsId, answerId: answerId, text: commentStr);

      await getIt<NewsCommentsAddNetworkRequest>(param1: comment)();
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
      await getIt<NewsCommentsLikeNetworkRequest>(param1: commentId)();
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
        commentCount: comments.countComments(),
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
