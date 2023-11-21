// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/birthdays/sources/dependency.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

@singleton
class BirthdaysNetworkRequest extends BirthdaysRequestDependency {
  BirthdaysNetworkRequest();

  @override
  Future<Response<BirthdaysSuccess>> call() async {
    UserApi userApi = getIt<MainApiProvider>().getUserApi();
    return await userApi.userBirthdayGet();
  }
}
