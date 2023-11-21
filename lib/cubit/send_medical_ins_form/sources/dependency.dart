// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';
import 'package:openapi/openapi.dart';

abstract class SendMedicalInsFormRequestDependency {
  abstract MedicalInsuranceFormEntities? entities;
  Future<Response<OrderDMSSuccess>> call();
}
