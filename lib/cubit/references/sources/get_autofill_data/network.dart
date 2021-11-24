import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/model/reference_auto_fill.dart';
import 'dependency.dart';

@singleton
class GetAutofillNetworkRequest extends GetAutofillRequestDependency {
  GetAutofillNetworkRequest();

  @override
  Future<Response<ReferenceAutoFill>> call() async => await sl
      .get<MainApiProvider>()
      .getUserApi()
      .userGetreferenceautofillGet();
}
