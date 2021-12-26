// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/model/can_inquire.dart';
import 'dependency.dart';

@singleton
class CanInquireNetworkRequest extends CanInquireRequestDependency {
  CanInquireNetworkRequest();

  @override
  Future<Response<CanInquire>> call() async =>
      await sl<MainApiProvider>().getUserApi().userCaninquireGet();
}
