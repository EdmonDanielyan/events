import 'dart:convert';

class BoolState {
  final bool enable;
  const BoolState({
    required this.enable,
  });

  BoolState copyWith({
    bool? enable,
  }) {
    return BoolState(
      enable: enable ?? this.enable,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enable': enable,
    };
  }

  factory BoolState.fromMap(Map<String, dynamic> map) {
    return BoolState(
      enable: map['enable'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BoolState.fromJson(String source) =>
      BoolState.fromMap(json.decode(source));

  @override
  String toString() => 'BoolState(enable: $enable)';
}
