import 'package:dio/dio.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/model/can_inquire.dart';
import 'dependency.dart';

class CanInquireNetworkRequest extends CanInquireRequestDependency {
  CanInquireNetworkRequest();

  @override
  Future<Response<CanInquire>> makeRequest() async =>
      await MainApiClient().getUserApi().userCaninquireGet();
}
