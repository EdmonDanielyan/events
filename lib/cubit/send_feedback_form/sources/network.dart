import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/functions/files.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/screens/feedback/components/form/entities.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/model/send_feedback_success.dart';

import 'dependency.dart';

@injectable
class SendFeedbackFormNetworkRequest extends SendFeedbackFormDependency {
  ManagementFeedbackFormEntities? entities;
  SendFeedbackFormNetworkRequest({@factoryParam required this.entities})
      : assert(entities != null);

  @override
  Future<bool> call() async {
    Response<SendFeedbackSuccess> response = await sl
        .get<MainApiProvider>()
        .getUserApi()
        .userSendfeedbackPost(
          entities!.question,
          entities!.getTagsListString().join(", "),
          fio: entities!.name,
          contacts: entities!.email,
          filesLeftSquareBracketRightSquareBracket: entities!.files.length > 0
              ? getFilesAsMultipart(entities!.files)
              : null,
        )
        .timeout(Duration(seconds: 10));

    return response.statusCode == 200;
  }
}
