import 'dart:convert';

import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

enum CustomTextingEnum { EMPTY, TEXTING, SENDING_DOCUMENT }

class CustomTexting {
  final UserTable user;
  final CustomTextingEnum customTextingEnum;
  CustomTexting({
    required this.user,
    required this.customTextingEnum,
  });

  CustomTexting copyWith({
    UserTable? user,
    CustomTextingEnum? customTextingEnum,
  }) {
    return CustomTexting(
      user: user ?? this.user,
      customTextingEnum: customTextingEnum ?? this.customTextingEnum,
    );
  }

  Map<String, String> toMap() {
    return {
      'user': user.toJsonString(),
      'customTextingEnum': customTextingEnum.toString(),
    };
  }

  factory CustomTexting.fromMap(Map<String, dynamic> map) {
    return CustomTexting(
      user: UserTable.fromJson(jsonDecode(map['user'])),
      customTextingEnum:
          CustomTextingListView.stringToEnum(map['customTextingEnum']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomTexting.fromJson(String source) =>
      CustomTexting.fromMap(json.decode(source));

  @override
  String toString() =>
      'CustomTexting(user: $user, customTextingEnum: $customTextingEnum)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomTexting &&
        other.user == user &&
        other.customTextingEnum == customTextingEnum;
  }

  @override
  int get hashCode => user.hashCode ^ customTextingEnum.hashCode;
}

class CustomTextingListView {
  static CustomTextingEnum stringToEnum(String json) {
    for (final value in CustomTextingEnum.values) {
      if (json.toLowerCase().contains(value.toString().toLowerCase())) {
        return value;
      }
    }
    return CustomTextingEnum.EMPTY;
  }
}
