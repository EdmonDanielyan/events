class ChatScreenParams {
  final bool showTextField;
  final bool ignoreChatInfo;
  final bool ignoreHoverMessage;
  final String? appBarText;
  final bool showOnlyFilesAndLinks;

  const ChatScreenParams({
    this.showTextField = true,
    this.ignoreChatInfo = false,
    this.ignoreHoverMessage = false,
    this.appBarText,
    this.showOnlyFilesAndLinks = false,
  });
}

class ChatScreenParamsListView {
  static ChatScreenParams onlyFiles(String title) {
    return ChatScreenParams(
      showTextField: false,
      ignoreChatInfo: true,
      ignoreHoverMessage: true,
      appBarText: title,
      showOnlyFilesAndLinks: true,
    );
  }
}
