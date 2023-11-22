import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:openapi/openapi.dart';

extension GetUserSuccessExt on Response<GetUserSuccess> {
  UserProfileData mapResponse() {
    // final Map? userDataMap = this.data?.data.asMap;
    //migration
    final Map? userDataMap = data?.data?.asMap;

    if (userDataMap != null) {
      return UserProfileData.getUserFromResponse(userDataMap);
    } else {
      throw UnknownErrorException();
    }
  }
}
