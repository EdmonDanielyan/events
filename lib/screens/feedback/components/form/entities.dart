import 'dart:io';
import 'package:ink_mobile/models/selectfield.dart';

class ManagementFeedbackFormEntities {
  List<Selectfield> toWhom;
  String name;
  String email;
  String question;
  List<File> files;

  ManagementFeedbackFormEntities({
    this.toWhom = const [],
    this.name = "",
    this.email = "",
    this.question = "",
    this.files = const [],
  });

  List<String> getTagsListString() {
    return toWhom.map((e) => e.title).toList();
  }
}
