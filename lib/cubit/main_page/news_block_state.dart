
import 'package:ink_mobile/models/news_data.dart';

enum NewsBlockStateType {LOADING, LOADED, ERROR}

class NewsBlockState {
  final NewsBlockStateType type;
  final List<NewsItemData>? data;
  final String? errorMessage;

  NewsBlockState({
    required this.type,
    this.data,
    this.errorMessage
  }) : assert(
    type != NewsBlockStateType.ERROR
    || errorMessage != null
  );
}