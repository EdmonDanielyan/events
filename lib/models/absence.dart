
class Absence {
  String? reason;
  DateTime? from;
  DateTime? to;

  String _businessTripString = "Командировка";

  Absence({
    required this.reason,
    required this.from,
    required this.to,
  });

  factory Absence.fromMap(Map<String, dynamic> data) {
    return Absence(
      reason: data["reason"],
      from: DateTime.tryParse(data["from"]),
      to: DateTime.tryParse(data["to"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "reason": reason,
      "from": from.toString(),
      "to": to.toString(),
    };
  }

  Map<String, dynamic> toJson() => toMap();

  bool get isBusinessTrip => this.reason == _businessTripString;

  bool get isNotEmpty =>
      this.reason != null && this.from != null && this.to != null;
}
