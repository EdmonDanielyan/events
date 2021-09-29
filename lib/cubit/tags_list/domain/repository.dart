import 'package:ink_mobile/cubit/tags_list/sources/dependency.dart';
import 'package:ink_mobile/cubit/tags_list/sources/network.dart';

class TagsListRepository {
  TagsListRepository();

  TagsListRequestDependency getDependency() {
    return TagsListNetworkRequest();
  }
}
