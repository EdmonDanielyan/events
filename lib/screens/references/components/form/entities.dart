import 'dart:io';

class ReferencesFormEntities {
  int? referencesType;
  int? deliveryType;
  String fio;
  String fioChildren;
  String position;
  String department;
  String phone;
  int quantity;
  String toProvideIn;
  String period;
  DateTime periodFrom;
  DateTime periodTo;
  String address;
  String postCode;
  List<File> files;
  ReferencesFormEntities({
    this.deliveryType,
    this.referencesType,
    this.fio = "",
    this.fioChildren = "",
    this.position = "",
    this.department = "",
    this.phone = "",
    this.quantity = 1,
    this.toProvideIn = "",
    this.period = "",
    this.address = "",
    this.postCode = "",
    this.files = const [],
  })  : periodFrom = DateTime.now(),
        periodTo = DateTime.now();

  void clear() {
    deliveryType = null;
  }
}
