import 'package:dio/dio.dart';
import 'package:ink_mobile/models/references/delivery_list.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';
import 'package:main_api_client/model/order_reference_success.dart';

abstract class SendReferenceFormRequestDependency {
  abstract ReferencesFormEntities entities;
  abstract ReferencesItem referencesItem;
  abstract DeliveryItem deliveryItem;
  Future<Response<OrderReferenceSuccess>> makeRequest();
}
