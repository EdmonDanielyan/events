class Paginator {
  int limit;
  int page;
  bool block;

  Paginator({required this.limit, this.page = 1, this.block = false});

  void clear({int? page}) {
    page = page ?? 1;
    block = false;
  }
}
