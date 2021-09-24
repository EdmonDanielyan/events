import 'package:ink_mobile/cubit/profile/sources/thank/dependency.dart';

class ProfileThank {
  final ProfileThankRequestDependency dependency;

  ProfileThank({required this.dependency});

  Future<void> thank() async => await dependency.makeRequest();
}
