class ParseUrl {
  final String url;
  const ParseUrl(this.url);

  bool isStringUrl({String? newUrl}) {
    return Uri.tryParse(newUrl ?? url)?.hasAbsolutePath ?? false;
  }

  bool isStrPicture() {
    final picture = url.toLowerCase();
    bool hasType = picture.endsWith("jpg") ||
        picture.endsWith("png") ||
        picture.endsWith("jpeg") ||
        picture.endsWith("gif");
    return isStringUrl(newUrl: picture) && hasType;
  }
}
