class TextValidator {
  final String text;
  const TextValidator(this.text);

  bool isStringUrl() {
    return Uri.tryParse(text)?.hasAbsolutePath ?? false;
  }

  bool hasHttp() {
    return text.toLowerCase().contains("http");
  }
}
