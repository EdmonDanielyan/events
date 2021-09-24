import 'package:main_api_client/api.dart';

class SetOauthToken {
  final String token;
  late MainApiClient? apiClient;

  SetOauthToken({this.apiClient, required this.token}) {
    if (apiClient == null) {
      apiClient = MainApiClient();
    }
  }

  void setBearer() {
    apiClient!.setOAuthToken("bearerAuth", token);
  }
}
