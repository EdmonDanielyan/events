import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';
import 'dependency.dart';

@singleton
class CanInquireNetworkRequest extends CanInquireRequestDependency {
  CanInquireNetworkRequest();

  @override
  Future<Response<CanInquire>> call() async =>
      await getIt<MainApiProvider>().getUserApi().userCaninquireGet();
}
