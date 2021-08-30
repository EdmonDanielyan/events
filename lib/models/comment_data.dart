class CommentData {
  int newsId;
  int id;
  String? pathToAvatar;
  String authorName;
  String comment;
  int barrels;
  bool barrelsChecked;
  DateTime timeCreate;
  List<CommentData>? children;

  CommentData({
    required this.newsId,
    required this.id,
    this.pathToAvatar,
    required this.authorName,
    required this.comment,
    this.barrels = 0,
    this.barrelsChecked  = false,
    required this.timeCreate,
    this.children
  });
}
