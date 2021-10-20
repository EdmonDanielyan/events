import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/references/references_cubit.dart';
import 'package:ink_mobile/cubit/references/references_state.dart';
import 'package:ink_mobile/cubit/send_reference_form/send_form_cubit.dart';
import 'package:ink_mobile/screens/references/components/form/form.dart';
import 'package:ink_mobile/screens/references/components/permission_denied.dart';
import 'package:ink_mobile/setup.dart';
import 'loading.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            create: (context) => sl.get<SendReferenceFormCubit>(),
            child: SafeArea(
              child: ReferencesForm(),
            ),
          );
        },
      ),
    );
  }
}
