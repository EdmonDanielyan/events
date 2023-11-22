class FancyText {
  final String text;

  const FancyText(this.text);

  String maxLength(int limit, {bool ellipsis = true}) {
    if (text.length >= limit) {
      String newTxt = text.substring(0, limit);
      if (ellipsis) {
        newTxt = "$newTxt...";
      }
      return newTxt;
    }

    return text;
  }

  String cutName() {
    String newName = text;
    final splitName = newName.split(" ");
    if (splitName.length >= 2 &&
        splitName[0].length > 1 &&
        splitName[1].length > 1) {
      newName = "${splitName[0][0]}${splitName[1][0]}".trim();
    } else if (text.length >= 2) {
      newName = "${text[0]}${text[1]}".trim();
    }

    return newName.toUpperCase();
  }
}
