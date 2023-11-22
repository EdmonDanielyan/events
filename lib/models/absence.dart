import 'package:intl/intl.dart';

class Absence {
  String? reason;
  DateTime? from;
  DateTime? to;

  final String _businessTripString = "Командировка";

  Absence({
    required this.reason,
    required this.from,
    required this.to,
  });

  factory Absence.fromMap(Map<String, dynamic> data) {
    return Absence(
      reason: data["reason"],
      from: data["from"] != null
          ? DateFormat('yyyy-MM-dd').parse(data["from"])
          : null,
      to: data["to"] != null
          ? DateFormat('yyyy-MM-dd').parse(data["to"])
          : null,
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

  bool get isBusinessTrip => reason == _businessTripString;

  bool get isNotEmpty => reason != null && from != null && to != null;
}
