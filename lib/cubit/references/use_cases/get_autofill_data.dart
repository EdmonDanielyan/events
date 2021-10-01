import 'package:dio/dio.dart';
import 'package:ink_mobile/cubit/references/sources/get_autofill_data/dependency.dart';
import 'package:ink_mobile/models/autofill.dart';
import 'package:main_api_client/model/reference_auto_fill.dart';

class GetAutofill {
  final GetAutofillRequestDependency dependency;

  GetAutofill({required this.dependency});

  Future<Autofill> call() async {
    Response<ReferenceAutoFill> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  Autofill mapResponse(Response<ReferenceAutoFill> response) {
    return Autofill(
      fio: response.data?.data.fio ?? '',
      position: response.data?.data.position ?? '',
      department: response.data?.data.department ?? '',
    );
  }
}
