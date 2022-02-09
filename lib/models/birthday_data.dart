// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:main_api_client/model/user_properties.dart';

class BirthdayData {
  int id;
  String? name;
  String? workPosition;
  String? city;
  String? birthday;
  String? pathToAvatar;

  BirthdayData(
      {required this.id,
      required this.name,
      required this.workPosition,
      required this.city,
      this.pathToAvatar,
      this.birthday});

  factory BirthdayData.fromResponse(UserProperties userData) {
    return BirthdayData(
        id: userData.id,
        name: "${userData.lastName} ${userData.name}".trim(),
        workPosition: userData.workPosition,
        city: userData.workCity,
        birthday: userData.birthdayString,
        pathToAvatar: userData.avatar);
  }
}
