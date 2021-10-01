import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/functions/files.dart';
import 'package:ink_mobile/screens/feedback/components/form/entities.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/model/send_feedback_success.dart';

import 'dependency.dart';

class SendFeedbackFormNetworkRequest extends SendFeedbackFormDependency {
  ManagementFeedbackFormEntities entities;
  SendFeedbackFormNetworkRequest({required this.entities});

  @override
  Future<bool> makeRequest() async {
    Response<SendFeedbackSuccess> response = await MainApiClient()
        .getUserApi()
        .userSendfeedbackPost(
          entities.question,
          entities.getTagsListString().join(", "),
          fio: entities.name,
          contacts: entities.email,
          filesLeftSquareBracketRightSquareBracket: entities.files.length > 0
              ? getFilesAsMultipart(entities.files)
              : null,
        )
        .timeout(Duration(seconds: 10));

    return response.statusCode == 200;
  }
}
