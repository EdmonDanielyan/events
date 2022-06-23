class Plural {
  final num number;

  const Plural(this.number);

  String declense(String one, String two, String many) {
    var n = number.abs();
    n %= 100;
    if (n >= 5 && n <= 20) {
      return many;
    }
    n %= 10;
    if (n == 1) {
      return one;
    }
    if (n >= 2 && n <= 4) {
      return two;
    }
    return many;
  }
}
