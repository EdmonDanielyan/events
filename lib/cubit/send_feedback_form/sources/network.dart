import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/screens/feedback/components/form/entities.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class SendFeedbackFormNetworkRequest extends SendFeedbackFormDependency {
  @override
  ManagementFeedbackFormEntities? entities;
  SendFeedbackFormNetworkRequest({@factoryParam required this.entities})
      : assert(entities != null);

  @override
  Future<bool> call() async {
    Response<SendFeedbackSuccess> response = await getIt
        .get<MainApiProvider>()
        .getUserApi()
        .userSendfeedbackPost(
          question: entities!.question,
          tags: entities!.getTagsListString().join(", "),
          fio: entities!.name,
          contacts: entities!.email,
        )
        .timeout(const Duration(minutes: 5));

    return response.statusCode == 200;
  }
}
