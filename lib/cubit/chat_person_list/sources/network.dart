import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class ContactsNetworkRequest extends ContactsRequestDependency {
  @override
  String? query;
  ContactsNetworkRequest({@factoryParam required this.query})
      : assert(query != null);

  @override
  Future<Response<GetContacts>> call() async {
    ContactsApi contactsApi = getIt<MainApiProvider>().getContactsApi();
    final response = await contactsApi.getContacts(
        search: query!.length < 3 ? null : query,
        pageNumber: 1,
        countOnPage: 70);
    return response;
  }
}
