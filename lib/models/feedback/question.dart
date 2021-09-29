import 'dart:convert';

class Question {
  final int id;
  final String pathToAvatar;
  final String name;
  final String body;
  final int upvotes;
  final int downvotes;
  final String section;
  final DateTime createdDate;
  final Question? answer;
  const Question({
    required this.id,
    required this.pathToAvatar,
    required this.name,
    required this.body,
    this.upvotes = 0,
    this.downvotes = 0,
    this.section = "",
    required this.createdDate,
    this.answer,
  });

  Question copyWith({
    int? id,
    String? pathToAvatar,
    String? name,
    String? body,
    int? upvotes,
    int? downvotes,
    String? section,
    DateTime? createdDate,
    Question? answer,
  }) {
    return Question(
      id: id ?? this.id,
      pathToAvatar: pathToAvatar ?? this.pathToAvatar,
      name: name ?? this.name,
      body: body ?? this.body,
      upvotes: upvotes ?? this.upvotes,
      downvotes: downvotes ?? this.downvotes,
      section: section ?? this.section,
      createdDate: createdDate ?? this.createdDate,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pathToAvatar': pathToAvatar,
      'name': name,
      'body': body,
      'upvotes': upvotes,
      'downvotes': downvotes,
      'section': section,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'answer': answer?.toMap(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      pathToAvatar: map['pathToAvatar'],
      name: map['name'],
      body: map['body'],
      upvotes: map['upvotes'],
      downvotes: map['downvotes'],
      section: map['section'],
      createdDate: DateTime.fromMillisecondsSinceEpoch(map['createdDate']),
      answer: Question.fromMap(map['answer']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(id: $id, pathToAvatar: $pathToAvatar, name: $name, body: $body, upvotes: $upvotes, downvotes: $downvotes, section: $section, createdDate: $createdDate, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.id == id &&
        other.pathToAvatar == pathToAvatar &&
        other.name == name &&
        other.body == body &&
        other.upvotes == upvotes &&
        other.downvotes == downvotes &&
        other.section == section &&
        other.createdDate == createdDate &&
        other.answer == answer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pathToAvatar.hashCode ^
        name.hashCode ^
        body.hashCode ^
        upvotes.hashCode ^
        downvotes.hashCode ^
        section.hashCode ^
        createdDate.hashCode ^
        answer.hashCode;
  }
}
