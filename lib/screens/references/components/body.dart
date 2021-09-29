import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/references/references_cubit.dart';
import 'package:ink_mobile/cubit/references/references_state.dart';
import 'package:ink_mobile/cubit/send_reference_form/send_form_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/references/components/form/form.dart';
import 'package:ink_mobile/screens/references/components/permission_denied.dart';
import 'loading.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Container(
      child: BlocBuilder<ReferencesPageCubit, ReferencesPageState>(
        builder: (context, state) {
          final ReferencesPageCubit referencesCubit =
              BlocProvider.of<ReferencesPageCubit>(context);

          if (state.type == ReferencesStateType.LOADING) {
            referencesCubit.checkPermissions();
            return Loading();
          }

          if (state.type == ReferencesStateType.PERMISSIONS_DENIED) {
            return PermissionDenied();
          }

          if (state.type == ReferencesStateType.INIT) {
            referencesCubit.loadAutoFillData();
          }

          return BlocProvider(
            create: (context) =>
                SendReferenceFormCubit(languageStrings: _strings),
            child: SafeArea(
              child: ReferencesForm(),
            ),
          );
        },
      ),
    );
  }
}
