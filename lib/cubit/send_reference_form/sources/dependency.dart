import 'package:dio/dio.dart';
import 'package:ink_mobile/models/send_reference_form_entities.dart';
import 'package:main_api_client/model/order_reference_success.dart';

abstract class SendReferenceFormRequestDependency {
  abstract SendReferenceFormEntities? entities;
  Future<Response<OrderReferenceSuccess>> call();
}
