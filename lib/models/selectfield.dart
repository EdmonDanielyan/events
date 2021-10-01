class Selectfield {
  final String id;
  final String title;
  String description;
  bool subWidget;

  Selectfield({
    required this.id,
    required this.title,
    this.description = "",
    this.subWidget = false,
  });
}
