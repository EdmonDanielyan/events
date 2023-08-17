class FilterItem {
  final String title;
  final String code;

  const FilterItem({required this.title, required this.code});

  factory FilterItem.fromMap(Map<String, dynamic> map) {
    return FilterItem(
      title: map["title"],
      code: map["code"],
    );
  }

  static List<FilterItem> getListFromResponse(List listData) {
    List<FilterItem> list = [];

    listData.forEach((element) {
      list.add(FilterItem.fromMap(element));
    });

    return list;
  }
}
