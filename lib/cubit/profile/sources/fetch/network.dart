// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';


import 'dependency.dart';

@injectable
class ProfileFetchNetworkRequest extends ProfileFetchRequestDependency {
  int? id;
  ProfileFetchNetworkRequest({@factoryParam required this.id});

  @override
  Future<Response<GetUserSuccess>> call() async {
    UserApi user = getIt<MainApiProvider>().getUserApi();
    Response<GetUserSuccess> response;
    if (id == null) {
      response = await user.userGet();
    } else {
      //TODO: clean code
      response = await user.userIdGet(id: id ?? 1);
    }

    return response;
  }

  @override
  Future<Response<GetUsersSuccess>> getUsers(List<int> ids) async {
    final userApi = getIt<MainApiProvider>().getUserApi();
    final builder = GetUsersBuilder()..users.addAll(ids);
    final response = await userApi.usersPost(getUsers: builder.build());

    return response;
  }
}
