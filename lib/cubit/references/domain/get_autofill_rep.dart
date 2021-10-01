import 'package:ink_mobile/cubit/references/sources/get_autofill_data/dependency.dart';
import 'package:ink_mobile/cubit/references/sources/get_autofill_data/network.dart';

class GetAutofillRepository {
  GetAutofillRepository();

  GetAutofillRequestDependency getDependency() {
    return GetAutofillNetworkRequest();
  }
}
