import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/references/domain/get_autofill_rep.dart';
import 'package:ink_mobile/cubit/references/references_state.dart';
import 'package:ink_mobile/cubit/references/use_cases/check_permission.dart';
import 'package:ink_mobile/cubit/references/use_cases/get_autofill_data.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/autofill.dart';
import 'package:ink_mobile/models/token.dart';

import 'domain/check_perm_rep.dart';

class ReferencesPageCubit extends Cubit<ReferencesPageState> {
  final LanguageStrings languageStrings;
  ReferencesPageCubit({required this.languageStrings})
      : super(ReferencesPageState(type: ReferencesStateType.LOADING));

  Autofill autofill = Autofill();

  Future<void> checkPermissions() async {
    await Token.setNewTokensIfExpired();

    bool access = await CheckPermission(
            dependency: CheckPermissionRepository().getDependency())
        .call();
    access
        ? emit(ReferencesPageState(type: ReferencesStateType.INIT))
        : emit(
            ReferencesPageState(type: ReferencesStateType.PERMISSIONS_DENIED));
  }

  Future<void> loadAutoFillData() async {
    await Token.setNewTokensIfExpired();
    autofill =
        await GetAutofill(dependency: GetAutofillRepository().getDependency())
            .call();
  }
}
