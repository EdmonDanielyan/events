// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/models/movements_data.dart';
import 'package:openapi/openapi.dart';

extension MovementsSuccessExt on Response<MovementsSuccess> {
  List<MovementsData> mapResponse() {
    List<MovementsData> movementsData = [];

    this.data?.data?.forEach((movement) {
      movementsData.add(MovementsData(
          period: movement.period ?? '',
          position: movement.position ?? '',
          department: movement.department ?? '',
          organization: movement.organization ?? '',
          operation: movement.operation ?? '',
          pnum: movement.pnum ?? ''));
    });
    return movementsData;
  }
}

// TODO migration
// extension MovementsSuccessExt on Response<MovementsSuccess> {
//   List<MovementsData> mapResponse() {
//     List<MovementsData> movementsData = [];

//     this.data?.data.forEach((movement) {
//       movementsData.add(MovementsData(
//           period: movement.period,
//           position: movement.position,
//           department: movement.department,
//           organization: movement.organization,
//           operation: movement.operation,
//           pnum: movement.pnum));
//     });
//     return movementsData;
//   }
// }