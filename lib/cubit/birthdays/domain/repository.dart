import 'package:ink_mobile/cubit/birthdays/sources/dependency.dart';
import 'package:ink_mobile/cubit/birthdays/sources/network.dart';

class BirthdaysRepository {
  BirthdaysRepository();

  BirthdaysRequestDependency getDependency() {
    return BirthdaysNetworkRequest();
  }
}
