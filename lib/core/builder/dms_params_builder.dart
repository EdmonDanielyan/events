// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports
import 'package:openapi/openapi.dart';

class CustomDMSParamsBuilder {
  final String type;
  final String name;
  final String birthday;
  final String position;
  final String phone;
  final String email;
  final String additionalInformation;
  final bool? dentalSelect;
  final bool? specSelect;
  final bool? labSelect;
  final bool? otherSelect;
  final String specText;
  final String labText;
  final String otherText;
  final String hospitalName;
  final String city;
  final String address;

  // TODO: CHECK
  //final String organization;
  final String price;
  final String dateStart;
  final String dateTo;

  CustomDMSParamsBuilder({
    required this.type,
    required this.name,
    required this.birthday,
    required this.position,
    required this.phone,
    required this.email,
    required this.additionalInformation,
    required this.dentalSelect,
    required this.specSelect,
    required this.labSelect,
    required this.otherSelect,
    required this.specText,
    required this.labText,
    required this.otherText,
    required this.hospitalName,
    required this.city,
    required this.address,
    // TODO: CHECK
    //required this.organization,
    required this.price,
    required this.dateStart,
    required this.dateTo,
  });

  OrderDMS build() {
    OrderDMSBuilder builder = OrderDMSBuilder();
    final nameList = name.split(" ");
    String lastName = nameList.length > 0 ? nameList[0] : "";
    String firstName = nameList.length > 1 ? nameList[1] : "";
    String secondName = nameList.length > 2 ? nameList[2] : "";

    builder.dmsType = type;
    builder.firstName = firstName;
    builder.secondName = secondName;
    builder.lastName = lastName;
    builder.birthday = birthday;
    builder.workPosition = position;
    builder.phone = phone;
    builder.email = email;
    builder.additionalInformation = additionalInformation;
    builder.dentalSelect = dentalSelect;
    builder.specSelect = specSelect;
    builder.labSelect = labSelect;
    builder.otherSelect = otherSelect;
    builder.specText = specText;
    builder.labText = labText;
    builder.otherText = otherText;
    builder.clinic = hospitalName;
    builder.city = city;
    builder.address = address;
    //TODO: CHECK
    //builder.organization = organization;
    builder.money = price;
    builder.date = dateStart;
    builder.dateTo = dateTo;

    return builder.build();
  }
}
