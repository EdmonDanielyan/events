import 'package:ink_mobile/cubit/send_medical_ins_form/sources/dependency.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/sources/network.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';

class SendMedicalInsFormRepository {
  final MedicalInsuranceFormEntities entities;
  SendMedicalInsFormRepository({required this.entities});

  SendMedicalInsFormRequestDependency getDependency() {
    return SendMedicalInsFormNetworkRequest(entities: entities);
  }
}
