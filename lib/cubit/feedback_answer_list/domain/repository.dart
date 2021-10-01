import 'package:ink_mobile/cubit/feedback_answer_list/sources/dependency.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/sources/network.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';

class FeedbackAnswerListRepository {
  final Pagination<ManagementAnswer> pagination;
  FeedbackAnswerListRepository({required this.pagination});

  FeedbackAnswerListRequestDependency getDependency() {
    return FeedbackAnswerListNetworkRequest(pagination: pagination);
  }
}
