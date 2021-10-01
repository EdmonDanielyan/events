import 'package:ink_mobile/cubit/search/sources/dependency.dart';
import 'package:ink_mobile/cubit/search/sources/network.dart';

class SearchRepository {
  final String query;
  SearchRepository({required this.query});

  SearchRequestDependency getDependency() {
    return SearchNetworkRequest(query: query);
  }
}
