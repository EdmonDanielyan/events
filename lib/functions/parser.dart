class Parser {
  static int stringToInt(String val) {
    try {
      return int.parse(val);
    } catch (_) {
      return 0;
    }
  }
}
