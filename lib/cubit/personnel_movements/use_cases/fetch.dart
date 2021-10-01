import 'package:ink_mobile/cubit/personnel_movements/sources/dependency.dart';
import 'package:ink_mobile/models/movements_data.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/movements_success.dart';

class StaffMovementsFetch {
  final StaffMovementsRequestDependency dependency;

  StaffMovementsFetch({required this.dependency});

  Future<List<MovementsData>> call() async {
    Response<MovementsSuccess> response = await dependency.makeRequest();
    return mapResponse(response);
  }

  List<MovementsData> mapResponse(Response<MovementsSuccess> response) {
    List<MovementsData> movementsData = [];

    response.data?.data.forEach((movement) {
      movementsData.add(MovementsData(
          period: movement.period,
          position: movement.position,
          department: movement.department,
          organization: movement.organization,
          operation: movement.operation,
          pnum: movement.pnum));
    });
    return movementsData;
  }
}
