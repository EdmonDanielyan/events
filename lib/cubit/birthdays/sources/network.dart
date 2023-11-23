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
