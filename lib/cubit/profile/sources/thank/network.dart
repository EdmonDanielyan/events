import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/thank_api.dart';

import 'dependency.dart';

@injectable
class ProfileThankNetworkRequest extends ProfileThankRequestDependency {
  int? id;
  ProfileThankNetworkRequest({@factoryParam required this.id})
      : assert(id != null);

  @override
  Future<void> call() async {
    ThankApi thank = sl<MainApiProvider>().getThankApi();
    await thank.thankIdGet(id);
  }
}
