import 'package:ink_mobile/screens/feedback/components/form/entities.dart';

abstract class SendFeedbackFormDependency {
  abstract ManagementFeedbackFormEntities? entities;
  Future<bool> call();
}
