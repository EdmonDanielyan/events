// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:openapi/openapi.dart';

class CustomPatchCommentParamsBuilder {
  final String text;
  CustomPatchCommentParamsBuilder(
      {required this.text,});

  PatchComment build() {
    PatchCommentBuilder commentBuilder = PatchCommentBuilder();

    commentBuilder.text = text;

    return commentBuilder.build();
  }
}
