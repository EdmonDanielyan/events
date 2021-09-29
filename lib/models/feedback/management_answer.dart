class ManagementAnswer {
  final int id;
  final String responsible;
  final String question;
  final String answer;
  ManagementAnswer({
    required this.id,
    required this.responsible,
    required this.question,
    required this.answer,
  });

  ManagementAnswer copyWith({
    int? id,
    String? responsible,
    String? question,
    String? answer,
  }) {
    return ManagementAnswer(
      id: id ?? this.id,
      responsible: responsible ?? this.responsible,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }
}
