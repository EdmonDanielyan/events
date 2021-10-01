import 'package:dio/dio.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/model/reference_auto_fill.dart';
import 'dependency.dart';

class GetAutofillNetworkRequest extends GetAutofillRequestDependency {
  GetAutofillNetworkRequest();

  @override
  Future<Response<ReferenceAutoFill>> makeRequest() async =>
      await MainApiClient().getUserApi().userGetreferenceautofillGet();
}
