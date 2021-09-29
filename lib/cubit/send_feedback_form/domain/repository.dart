import 'package:ink_mobile/cubit/send_feedback_form/sources/dependency.dart';
import 'package:ink_mobile/cubit/send_feedback_form/sources/network.dart';
import 'package:ink_mobile/screens/feedback/components/form/entities.dart';

class SendFeedbackFormRepository {
  final ManagementFeedbackFormEntities entities;
  SendFeedbackFormRepository({required this.entities});

  SendFeedbackFormDependency getDependency() {
    return SendFeedbackFormNetworkRequest(entities: entities);
  }
}
