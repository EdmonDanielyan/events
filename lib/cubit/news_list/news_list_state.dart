import 'package:flutter/material.dart';
import 'package:ink_mobile/models/news_data.dart';

enum NewsListStateType { LOADING, LOADED, ERROR }

@immutable
class NewsListState {
  final List<NewsItemData>? data;
  final NewsListStateType type;
  final String? errorMessage;

  NewsListState({required this.type, this.data, this.errorMessage})
      : assert(type != NewsListStateType.ERROR || errorMessage != null,
            'errorMessage must not be null in error state');
}
