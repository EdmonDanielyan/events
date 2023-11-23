import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class ContactsRequestDependency {
  abstract String? query;
  Future<Response<GetContacts>> call();
}
