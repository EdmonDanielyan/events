class CommentData {
  int newsId;
  int id;
  String? pathToAvatar;
  String? authorName;
  String? authorLastName;
  String comment;
  int barrels;
  bool barrelsChecked;
  DateTime timeCreate;
  List<CommentData>? children;

  CommentData({
    required this.newsId,
    required this.id,
    this.pathToAvatar,
    this.authorName,
    this.authorLastName,
    required this.comment,
    this.barrels = 0,
    this.barrelsChecked  = false,
    required this.timeCreate,
    this.children
  });
}
