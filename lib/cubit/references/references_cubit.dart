import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/references/references_state.dart';
import 'package:ink_mobile/cubit/references/sources/check_permission/network.dart';
import 'package:ink_mobile/cubit/references/sources/get_autofill_data/network.dart';
import 'package:ink_mobile/models/autofill.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/reference_autofill.dart';

@singleton
class ReferencesPageCubit extends Cubit<ReferencesPageState> {
  ReferencesPageCubit()
      : super(ReferencesPageState(type: ReferencesStateType.LOADING));

  Autofill autofill = Autofill();

  Future<void> checkPermissions() async {
    await Token.setNewTokensIfExpired();

    final response = await getIt<CanInquireNetworkRequest>()();
    bool? access = response.data!.data;

    if(access != null ){access
         ? emit(ReferencesPageState(type: ReferencesStateType.INIT))
        : emit(
            ReferencesPageState(type: ReferencesStateType.PERMISSIONS_DENIED));
  }}

  Future<void> loadAutoFillData() async {
    await Token.setNewTokensIfExpired();
    final response = await getIt<GetAutofillNetworkRequest>()();

    autofill = response.mapResponse();
  }
}


//migration
// @singleton
// class ReferencesPageCubit extends Cubit<ReferencesPageState> {
//   ReferencesPageCubit()
//       : super(ReferencesPageState(type: ReferencesStateType.LOADING));

//   Autofill autofill = Autofill();

//   Future<void> checkPermissions() async {
//     await Token.setNewTokensIfExpired();

//     final response = await getIt<CanInquireNetworkRequest>()();
//     bool? access = response.data?.data;

//     if (access != null) {
//       access
//           ? emit(ReferencesPageState(type: ReferencesStateType.INIT))
//           : emit(ReferencesPageState(
//               type: ReferencesStateType.PERMISSIONS_DENIED));
//     } else
//       emit(ReferencesPageState(type: ReferencesStateType.PERMISSIONS_DENIED));
//   }

//   Future<void> loadAutoFillData() async {
//     await Token.setNewTokensIfExpired();
//     final response = await getIt<GetAutofillNetworkRequest>()();

//     autofill = response.mapResponse();
//   }
// }
