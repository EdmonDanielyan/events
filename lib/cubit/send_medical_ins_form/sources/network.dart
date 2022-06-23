// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/builder/dms_params_builder.dart';
import 'package:ink_mobile/core/lists/medical_services.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/model/order_dms_success.dart';
import 'dependency.dart';

@injectable
class SendMedicalInsFormNetworkRequest
    extends SendMedicalInsFormRequestDependency {
  MedicalInsuranceFormEntities? entities;
  SendMedicalInsFormNetworkRequest({@factoryParam required this.entities})
      : assert(entities != null);

  @override
  Future<Response<OrderDMSSuccess>> call() async {
    Selectfield? dentist = MedicalServicesList.getElementFromListById(
        entities!.services, MedicalServicesList.dentistId);
    Selectfield? specialist = MedicalServicesList.getElementFromListById(
        entities!.services, MedicalServicesList.specialistId);
    Selectfield? labResearch = MedicalServicesList.getElementFromListById(
        entities!.services, MedicalServicesList.researchId);
    Selectfield? other = MedicalServicesList.getElementFromListById(
        entities!.services, MedicalServicesList.otherId);

    final response =
        await getIt.get<MainApiProvider>().getUserApi().userOrderdmsPost(
              orderDMS: CustomDMSParamsBuilder(
                type: entities!.type,
                name: entities!.fio,
                birthday: entities!.birthDate,
                position: entities!.position,
                phone: entities!.phone,
                email: entities!.email,
                additionalInformation: entities!.additionalText,
                dentalSelect: dentist != null,
                specSelect: specialist != null,
                labSelect: labResearch != null,
                otherSelect: other != null,
                specText: specialist != null ? specialist.description : "",
                labText: labResearch != null ? labResearch.description : "",
                otherText: other != null ? other.description : "",
                hospitalName: entities!.hospitalName,
                city: entities!.city,
                address: entities!.address,
                price: entities!.price,
                dateStart: entities!.dateStart,
                dateTo: entities!.guaranteeLetterDate,
              ).build(),
            );
    return response;
  }
}
