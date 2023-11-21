// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';
import 'dependency.dart';

@injectable
class ProfileThankNetworkRequest extends ProfileThankRequestDependency {
  int? id;
  ProfileThankNetworkRequest({@factoryParam required this.id})
      : assert(id != null);

  @override
  Future<void> call() async {
    ThankApi thank = getIt<MainApiProvider>().getThankApi();
    //TODO: clean code
    await thank.thankIdGet(id: id ?? 0, heart: 0);
  }
}
