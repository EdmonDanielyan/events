// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/contacts_api.dart';
import 'package:main_api_client/model/get_contacts.dart';

import 'dependency.dart';

@injectable
class ContactsNetworkRequest extends ContactsRequestDependency {
  String? query;
  ContactsNetworkRequest({@factoryParam required this.query})
      : assert(query != null);

  @override
  Future<Response<GetContacts>> call() async {
    ContactsApi contactsApi = getIt<MainApiProvider>().getContactsApi();
    final response = await contactsApi
        .getContacts(
            search: query!.length < 3 ? null : query,
            pageNumber: 1,
            countOnPage: 70)
        .timeout(Duration(seconds: 4));
    return response;
  }
}
