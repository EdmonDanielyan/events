import 'package:ink_mobile/cubit/personnel_movements/sources/dependency.dart';
import 'package:ink_mobile/cubit/personnel_movements/sources/network.dart';

class StaffMovementsRepository {
  StaffMovementsRepository();

  StaffMovementsRequestDependency getDependency() {
    return StaffMovementsNetworkRequest();
  }
}
