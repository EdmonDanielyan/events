import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';

import 'dependency.dart';

@injectable
class NewsLikeNetworkRequest extends NewsLikeRequestDependency {
  int? newsId;
  NewsLikeNetworkRequest({@factoryParam required this.newsId})
      : assert(newsId != null);

  @override
  Future<void> call() async {
    //TODO: clean code
    await getIt<MainApiProvider>().getNewsApi().newsLikeIdGet(id: newsId ?? 1);
  }
}
