import 'package:ink_mobile/models/news_data.dart';
import 'package:collection/collection.dart';

extension ListNewsItemDataExt on List<NewsItemData>? {
  NewsItemData? getItem(int id) {
    if (this != null) {
      return this!.firstWhereOrNull((element) => element.id == id);
    }

    return null;
  }
}
