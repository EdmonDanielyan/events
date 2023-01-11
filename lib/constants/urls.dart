class UrlsConfig {
  static const prodUrl = "https://portal.irkutskoil.ru/api/v1/";
  static const debugUrl = "https://mp-test-portal.irkutskoil.ru/api/v1";

  static const wsProdUrl = "wss://messenger.irkutskoil.ru:3009";
  // TODO: wss for release
  static const wsDebugUrl = "ws://mp-test-portal.irkutskoil.ru:6042";

  static const supportUrl = "https://portal.irkutskoil.ru/login/report/";
  static const aboutCompany = "https://irkutskoil.ru/";
  static const pushBaseUrl = "http://ink-portal.ru/";

  static Set<String> messengerApiUrls = {
    "https://messenger.irkutskoil.ru:3009/api/v1",
    "https://mp-test-portal.irkutskoil.ru:8080/api/v1"
  };
}
