import 'package:dio/dio.dart';
import 'package:ink_mobile/messenger/providers/app_token.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';

class TokenInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await Token.setNewTokensIfExpired();
    final tokenProvider = getIt<AppTokenProvider>();
    await tokenProvider.setCurrentToken();
    options.headers.addAll(
      {
        "Authorization": "Bearer ${tokenProvider.currentToken}",
      },
    );

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
