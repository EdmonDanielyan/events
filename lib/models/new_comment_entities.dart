class NewCommentEntities {
  int id;
  int? answerId;
  String text;

  NewCommentEntities({required this.id, this.answerId, required this.text});
}

class EditingCommentEntities {
  int id;
  String text;

  EditingCommentEntities({required this.id, required this.text});
}
