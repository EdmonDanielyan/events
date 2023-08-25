import 'package:ink_mobile/models/selectfield.dart';

class MedicalInsuranceFormEntities {
  String type;
  String fio;
  String birthDate;
  String position;
  String phone;
  String email;
  List<Selectfield> services;
  String hospitalName;
  String city;
  String address;
  // TODO: CHECK
  String organisation;
  String price;
  String dateStart;
  String additionalText;
  String guaranteeLetterDate;
  bool isSymptomsORVI;

  MedicalInsuranceFormEntities({
    this.type = "",
    this.fio = "",
    this.birthDate = "",
    this.position = "",
    this.phone = "",
    this.email = "",
    this.services = const [],
    this.hospitalName = "",
    this.city = "",
    this.address = "",
    // TODO: CHECK
    this.organisation = "",
    this.price = "",
    this.dateStart = "",
    this.additionalText = "",
    this.guaranteeLetterDate = "",
    this.isSymptomsORVI = false,
  });
}
