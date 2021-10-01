import 'package:dio/dio.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/sources/dependency.dart';
import 'package:main_api_client/model/order_dms_success.dart';

class SendMedicalInsForm {
  final SendMedicalInsFormRequestDependency dependency;

  SendMedicalInsForm({required this.dependency});

  Future<Response<OrderDMSSuccess>> call() async {
    Response<OrderDMSSuccess> response = await dependency.makeRequest();
    return response;
  }
}
