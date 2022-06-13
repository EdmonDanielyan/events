import 'dart:convert';

import 'package:equatable/equatable.dart';

enum AppBackgroundState { foreground, background }

class AppState extends Equatable {
  // enum
  final AppBackgroundState state;
  const AppState({
    this.state = AppBackgroundState.foreground,
  });

  AppState copyWith({
    AppBackgroundState? state,
  }) {
    return AppState(
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'state': state.index,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      state: AppBackgroundState.values[map['state'] ?? 0],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source));

  @override
  String toString() => 'AppState(state: $state)';

  @override
  List<Object> get props => [state];
}
