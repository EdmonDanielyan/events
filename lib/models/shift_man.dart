class ShiftMan {
  int id;
  String login;
  String email;
  String fullName;
  String avatarUrl;

  ShiftMan({
    required this.id,
    required this.login,
    required this.email,
    required this.fullName,
    required this.avatarUrl,
  });

  factory ShiftMan.fromMap(Map<String, dynamic> data) {
    return ShiftMan(
      id: data["id"],
      login: data["login"],
      email: data["email"],
      fullName: data["text"],
      avatarUrl: data["photo"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "login": login,
      "email": email,
      "text": fullName,
      "photo": avatarUrl,
    };
  }

  Map<String, dynamic> toJson() => toMap();
}
