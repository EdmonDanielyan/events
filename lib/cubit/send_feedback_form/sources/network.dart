// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

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
    Response<SendFeedbackSuccess> response = await getIt
        .get<MainApiProvider>()
        .getUserApi()
        .userSendfeedbackPost(
          entities!.question,
          entities!.getTagsListString().join(", "),
          fio: entities!.name,
          contacts: entities!.email,
        )
        .timeout(const Duration(minutes: 5));

    return response.statusCode == 200;
  }
}
