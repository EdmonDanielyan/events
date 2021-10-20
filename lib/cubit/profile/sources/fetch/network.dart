import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/get_user_success.dart';

import 'dependency.dart';

@injectable
class ProfileFetchNetworkRequest extends ProfileFetchRequestDependency {
  int? id;
  ProfileFetchNetworkRequest({@factoryParam required this.id});

  @override
  Future<Response<GetUserSuccess>> call() async {
    UserApi user = sl.get<MainApiProvider>().getUserApi();
    Response<GetUserSuccess> response;
    if (id == null) {
      response = await user.userGet();
    } else {
      response = await user.userIdGet(id);
    }

    return response;
  }
}
