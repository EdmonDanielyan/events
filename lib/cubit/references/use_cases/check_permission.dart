import 'package:ink_mobile/cubit/references/sources/check_permission/dependency.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/can_inquire.dart';

class CheckPermission {
  final CanInquireRequestDependency dependency;

  CheckPermission({required this.dependency});

  Future<bool> call() async {
    Response<CanInquire> response = await dependency.makeRequest();

    return response.data!.data;
  }
}
