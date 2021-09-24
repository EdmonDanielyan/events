import 'package:ink_mobile/cubit/profile/sources/fetch/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_user_success.dart';

class ProfileFetch {
  final ProfileFetchRequestDependency dependency;

  ProfileFetch({required this.dependency});

  Future<UserProfileData> call() async {
    Response<GetUserSuccess> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  UserProfileData mapResponse(Response<GetUserSuccess> response) {
    final Map? userDataMap = response.data?.data.asMap;

    if (userDataMap != null) {
      return UserProfileData.getUserFromResponse(userDataMap);
    } else {
      throw UnknownErrorException();
    }
  }
}
