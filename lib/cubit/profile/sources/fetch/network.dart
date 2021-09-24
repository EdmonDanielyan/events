import 'package:main_api_client/api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/get_user_success.dart';

import 'dependency.dart';

class ProfileFetchNetworkRequest extends ProfileFetchRequestDependency {
  int? id;
  ProfileFetchNetworkRequest({required this.id});

  @override
  Future<Response<GetUserSuccess>> makeRequest() async {
    UserApi user = MainApiClient().getUserApi();
    Response<GetUserSuccess> response;
    if (id == null) {
      response = await user.userGet();
    } else {
      response = await user.userIdGet(id);
    }

    return response;
  }
}
