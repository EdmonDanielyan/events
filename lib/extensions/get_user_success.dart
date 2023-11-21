// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:openapi/openapi.dart';

extension GetUserSuccessExt on Response<GetUserSuccess> {
  UserProfileData mapResponse() {
    final Map? userDataMap = this.data?.data.asMap;

    if (userDataMap != null) {
      return UserProfileData.getUserFromResponse(userDataMap);
    } else {
      throw UnknownErrorException();
    }
  }
}
