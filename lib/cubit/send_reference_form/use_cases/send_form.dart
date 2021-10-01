import 'package:dio/dio.dart';
import 'package:ink_mobile/cubit/send_reference_form/sources/dependency.dart';
import 'package:main_api_client/model/order_reference_success.dart';

class SendReferenceForm {
  final SendReferenceFormRequestDependency dependency;

  SendReferenceForm({required this.dependency});

  Future<Response<OrderReferenceSuccess>> call() async {
    Response<OrderReferenceSuccess> response = await dependency.makeRequest();
    return response;
  }
}
