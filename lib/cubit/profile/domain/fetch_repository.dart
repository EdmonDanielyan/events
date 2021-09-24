import 'package:ink_mobile/cubit/profile/sources/fetch/dependency.dart';
import 'package:ink_mobile/cubit/profile/sources/fetch/network.dart';

class ProfileFetchRepository {
  final int? userId;
  ProfileFetchRepository({required this.userId});

  ProfileFetchRequestDependency getDependency() {
    return ProfileFetchNetworkRequest(id: userId);
  }
}
