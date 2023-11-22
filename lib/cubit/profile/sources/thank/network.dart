import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';
import 'dependency.dart';

@injectable
class ProfileThankNetworkRequest extends ProfileThankRequestDependency {
  @override
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
