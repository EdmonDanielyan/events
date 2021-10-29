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
    ContactsApi contactsApi = sl.get<MainApiProvider>().getContactsApi();
    final response = await contactsApi
        .getContacts(
            search: query!.length < 3 ? null : query,
            pageNumber: 1,
            countOnPage: 10)
        .timeout(Duration(seconds: 4));
    print(response);
    return response;
  }
}
