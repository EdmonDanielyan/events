import 'package:ink_mobile/cubit/send_feedback_form/sources/dependency.dart';

class SendFeedbackForm {
  final SendFeedbackFormDependency dependency;

  SendFeedbackForm({required this.dependency});

  Future<bool> call() async => await dependency.makeRequest();
}
