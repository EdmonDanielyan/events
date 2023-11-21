// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:openapi/openapi.dart';


extension GetUserSuccessExt on Response<GetUsersSuccess> {
  List<UserProfileData> mapResponse() {
    final List<Map?>? userDataMap =
        // this.data?.data.asMap().values.map((e) => e.asMap).toList();
        //migration
        this.data?.data?.asMap().values.map((e) => e.asMap).toList();

    if (userDataMap != null) {
      return userDataMap
          .map((e) => UserProfileData.getUserFromResponse(e!))
          .toList();
    } else {
      throw UnknownErrorException();
    }
  }
}
