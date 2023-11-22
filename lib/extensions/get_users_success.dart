import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:openapi/openapi.dart';

extension GetUserSuccessExt on Response<GetUsersSuccess> {
  List<UserProfileData> mapResponse() {
    final List<Map?>? userDataMap =
        // this.data?.data.asMap().values.map((e) => e.asMap).toList();
        //migration
        data?.data?.asMap().values.map((e) => e.asMap).toList();

    if (userDataMap != null) {
      return userDataMap
          .map((e) => UserProfileData.getUserFromResponse(e!))
          .toList();
    } else {
      throw UnknownErrorException();
    }
  }
}
