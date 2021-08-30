import 'package:main_api_client/model/user_properties.dart';

class BirthdayData {
  int id;
  String? name;
  String? workPosition;
  String? city;
  String? birthday;
  String? pathToAvatar;

  BirthdayData({
    required this.id,
    required this.name,
    required this.workPosition,
    required this.city,
    this.pathToAvatar,
    this.birthday
  });

  factory BirthdayData.fromResponse(UserProperties userData)
  {
    return BirthdayData(
      id: userData.id,
      name: userData.name,
      workPosition: userData.workPosition,
      city: userData.workCity,
      birthday: userData.birthdayString,
      pathToAvatar: userData.avatar
    );
  }
}