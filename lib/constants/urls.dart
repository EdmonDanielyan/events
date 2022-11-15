class UrlsConfig {
  static const prodUrl = "https://portal.irkutskoil.ru/api/v1/";
  static const debugUrl = "https://test.ink.vpool.qsoft.ru/api/v1";
  static const wsProdUrl = "wss://messenger.irkutskoil.ru:3009";
  static const wsDebugUrl = "wss://ink.vpool.qsoft.ru";
  static const supportUrl = "https://portal.irkutskoil.ru/login/report/";

  static Set<String> messengerApiUrls = {
    "https://messenger.irkutskoil.ru:3009/api/v1",
    "https://ink.vpool.qsoft.ru/api/v1"
  };

  static String get apiUrl => debugUrl; // kDebugMode ? debugUrl : prodUrl;
  static String get wsUrl => wsDebugUrl; // kDebugMode ? wsDebugUrl : wsProdUrl;
  static String get messengerApiUrl => messengerApiUrls
      .last; // kDebugMode ? messengerApiUrls.last : messengerApiUrls.first;
}
