import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';

import 'dependency.dart';

@injectable
class NewsCommentsLikeNetworkRequest extends NewsCommentsLikeRequestDependency {
  int? commentId;
  NewsCommentsLikeNetworkRequest({@factoryParam required this.commentId})
      : assert(commentId != null);

  @override
  Future<void> call() async {
    await getIt
        .get<MainApiProvider>()
        .getNewsApi()
        //TODO clean code
        .newsCommentsLikeIdGet(id : commentId ?? 0);
  }
}
