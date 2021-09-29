import 'package:ink_mobile/cubit/references/sources/check_permission/dependency.dart';
import 'package:ink_mobile/cubit/references/sources/check_permission/network.dart';

class CheckPermissionRepository {
  CheckPermissionRepository();

  CanInquireRequestDependency getDependency() {
    return CanInquireNetworkRequest();
  }
}
