class Paginator {
  int limit;
  int page;
  bool block;
  int newMessagesOffset;

  Paginator({required this.limit, this.page = 1, this.block = false, this.newMessagesOffset = 0});

  void clear({int? page}) {
    page = page ?? 1;
    block = false;
    newMessagesOffset = 0;
  }
}
