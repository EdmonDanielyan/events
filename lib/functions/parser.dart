class Parser {
  final String val;

  const Parser({required this.val});

  int stringToInt() {
    try {
      return int.parse(val);
    } catch (_) {
      return 0;
    }
  }
}
