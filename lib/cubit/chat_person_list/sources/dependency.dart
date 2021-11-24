import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_contacts.dart';

abstract class ContactsRequestDependency {
  abstract String? query;
  Future<Response<GetContacts>> call();
}
