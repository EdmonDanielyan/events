import 'package:ink_mobile/models/news_data.dart';

import '../../models/filter_item.dart';

enum NewsBlockStateType { LOADING, LOADED, ERROR }

class NewsBlockState {
  final NewsBlockStateType type;
  final List<NewsItemData>? data;
  final List<FilterItem>? tabs;
  final String? errorMessage;

  NewsBlockState({required this.type, this.data, this.tabs, this.errorMessage})
      : assert(type != NewsBlockStateType.ERROR || errorMessage != null);
}
