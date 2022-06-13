import 'dart:convert';

import 'package:equatable/equatable.dart';

class BaseUrlState extends Equatable {
  final String url;
  const BaseUrlState({
    this.url = "",
  });

  BaseUrlState copyWith({
    String? url,
  }) {
    return BaseUrlState(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory BaseUrlState.fromMap(Map<String, dynamic> map) {
    return BaseUrlState(
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseUrlState.fromJson(String source) =>
      BaseUrlState.fromMap(json.decode(source));

  @override
  String toString() => 'BaseUrlState(url: $url)';

  @override
  List<Object> get props => [url];
}
