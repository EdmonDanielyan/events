import 'package:flutter/material.dart';
import 'package:ink_mobile/models/news_data.dart';

enum NewsDetailStateType { LOADING, LOADED, ERROR }

@immutable
class NewsDetailState {
  final NewsItemData? data;
  final NewsDetailStateType type;
  final String? errorMessage;

  const NewsDetailState({required this.type, this.data, this.errorMessage})
      : assert(type != NewsDetailStateType.ERROR || errorMessage != null,
            'errorMessage must not be null in error state');
}
