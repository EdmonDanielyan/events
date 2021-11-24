import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/references/references_cubit.dart';
import 'package:ink_mobile/cubit/references/references_state.dart';
import 'package:ink_mobile/cubit/send_reference_form/send_form_cubit.dart';
import 'package:ink_mobile/screens/references/components/form/form.dart';
import 'package:ink_mobile/screens/references/components/permission_denied.dart';
import 'loading.dart';

class Body extends StatelessWidget {
  final SendReferenceFormCubit sendReferenceFormCubit;
  final ReferencesPageCubit referencesPageCubit;
  const Body({
    Key? key,
    required this.referencesPageCubit,
    required this.sendReferenceFormCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<ReferencesPageCubit, ReferencesPageState>(
        bloc: referencesPageCubit,
        builder: (context, state) {
          if (state.type == ReferencesStateType.LOADING) {
            referencesPageCubit.checkPermissions();
            return Loading();
          }

          if (state.type == ReferencesStateType.PERMISSIONS_DENIED) {
            return PermissionDenied();
          }

          if (state.type == ReferencesStateType.INIT) {
            referencesPageCubit.loadAutoFillData();
          }

          return SafeArea(
            child: ReferencesForm(
              referencesPageCubit: referencesPageCubit,
              sendReferenceFormCubit: sendReferenceFormCubit,
            ),
          );
        },
      ),
    );
  }
}
