class AppConfig {
  final String serverUrl;
  final String wsUrl;
  final String? wsPath;
  final String messengerApiUrl;

  const AppConfig({
    required this.serverUrl,
    required this.wsUrl,
    required this.wsPath,
    required this.messengerApiUrl,
  });
}
