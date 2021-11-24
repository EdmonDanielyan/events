import 'package:dio/dio.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';
import 'package:main_api_client/model/order_dms_success.dart';

abstract class SendMedicalInsFormRequestDependency {
  abstract MedicalInsuranceFormEntities? entities;
  Future<Response<OrderDMSSuccess>> call();
}
