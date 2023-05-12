enum AbsenceReason { vacation, businessTrip }

class Absence {
  AbsenceReason? reason;
  DateTime? from;
  DateTime? to;

  Absence({
    required this.reason,
    required this.from,
    required this.to,
  });

  factory Absence.fromMap(Map<String, dynamic> data) {
    return Absence(
      reason: absenceReasonsMap.entries
          .firstWhere((element) => element.value == data["reason"])
          .key,
      from: DateTime.tryParse(data["from"]),
      to: DateTime.tryParse(data["from"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "reason": reason?.name,
      "from": from.toString(),
      "to": to.toString(),
    };
  }

  static Map<AbsenceReason, String> absenceReasonsMap = {
    AbsenceReason.businessTrip: "Командировка",
    AbsenceReason.vacation: "Отсутствие (отпуск основной)",
  };
}
