import 'dart:convert';

import 'package:flutter/foundation.dart';

class Pagination<T> {
  List<T> items;
  int countOnPage;
  int pageNumber;
  bool next;
  Pagination({
    this.items = const [],
    required this.countOnPage,
    this.pageNumber = 1,
    this.next = true,
  });

  void clear() {
    pageNumber = 1;
    next = true;
    items = [];
  }

  Pagination<T> copyWith({
    List<T>? items,
    int? countOnPage,
    int? pageNumber,
    bool? next,
  }) {
    return Pagination<T>(
      items: items ?? this.items,
      countOnPage: countOnPage ?? this.countOnPage,
      pageNumber: pageNumber ?? this.pageNumber,
      next: next ?? this.next,
    );
  }
}
