import 'package:ink_mobile/cubit/references/domain/get_autofill_rep.dart';
import 'package:ink_mobile/cubit/references/use_cases/get_autofill_data.dart';
import 'package:ink_mobile/models/autofill.dart';
import 'package:ink_mobile/models/token.dart';

class GetAutofill {
  Autofill autofill = Autofill();

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      autofill = await GetAutofillRequest(
              dependency: GetAutofillRepository().getDependency())
          .call();
    } catch (_) {}
  }
}
