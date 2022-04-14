import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:logging/logging.dart';

class TokenInterceptor implements Interceptor {
  final bool passError;
  TokenInterceptor({this.passError = true});

  final logger = Logger("");

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    logger.warning('''
        ---REQUEST ERROR---
        Uri ${err.requestOptions.uri}
        Error: ${err.error}
        Message: ${err.message}
    ''');
    if (passError) return;

    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await Token.setNewTokensIfExpired();
    final token = await Token.getJwt();

    if (token != null) {
      options.headers.addAll(
        {
          "Authorization": "Bearer $token",
        },
      );
      //   logger.fine('''
      //     ---REQUEST---
      //     Uri ${options.uri}
      //     Data: ${options.data}
      //     Headers: ${options.headers}
      // ''');
      return handler.next(options);
    }

    return;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // logger.fine('''
    //     ---RESPONSE---
    //     Uri ${response.realUri}
    //     Data: ${response.data}
    //     Headers: ${response.headers}
    // ''');
    return handler.next(response);
  }
}
