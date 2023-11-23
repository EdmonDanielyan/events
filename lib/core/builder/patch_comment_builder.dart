import 'package:openapi/openapi.dart';

class CustomPatchCommentParamsBuilder {
  final String text;
  CustomPatchCommentParamsBuilder({
    required this.text,
  });

  PatchComment build() {
    PatchCommentBuilder commentBuilder = PatchCommentBuilder();

    commentBuilder.text = text;

    return commentBuilder.build();
  }
}
