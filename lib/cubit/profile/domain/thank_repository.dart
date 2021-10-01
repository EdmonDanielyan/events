import 'package:ink_mobile/cubit/profile/sources/thank/dependency.dart';
import 'package:ink_mobile/cubit/profile/sources/thank/network.dart';

class ProfileThankRepository {
  final int userId;
  ProfileThankRepository({required this.userId});

  ProfileThankRequestDependency getDependency() {
    return ProfileThankNetworkRequest(id: userId);
  }
}
