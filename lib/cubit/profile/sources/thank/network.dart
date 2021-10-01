import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/thank_api.dart';

import 'dependency.dart';

class ProfileThankNetworkRequest extends ProfileThankRequestDependency {
  int id;
  ProfileThankNetworkRequest({required this.id});

  @override
  Future<void> makeRequest() async {
    ThankApi thank = MainApiClient().getThankApi();
    await thank.thankIdGet(id);
  }
}
