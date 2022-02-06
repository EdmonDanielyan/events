import 'package:json_annotation/json_annotation.dart';

part 'jwt_payload.g.dart';

@JsonSerializable()
class JwtPayload {
  @JsonKey(defaultValue: '')
  final String natsToken;
  @JsonKey(defaultValue: 0, name: "exp")
  final int expirationTime;
  @JsonKey(defaultValue: 0, name: "userId")
  final int userId;
  @JsonKey(defaultValue: '')
  final String avatar;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: '')
  final String secondName;

  static late int myId;
  static late String myAvatar;
  static late String myName;

  JwtPayload(this.lastName, this.secondName,
      {required this.natsToken,
      required this.expirationTime,
      required this.userId,
      required this.avatar,
      required this.name}) {
    myId = this.userId;
    myAvatar = this.avatar;
    myName = "$name $lastName".trim();
  }
  factory JwtPayload.fromJson(Map<String, dynamic> json) => _$JwtPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$JwtPayloadToJson(this);
}
