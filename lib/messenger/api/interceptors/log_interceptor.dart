import 'package:dio/dio.dart';
import 'package:ink_mobile/messenger/providers/logger.dart';

class CustomLogInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    logger.i('''
        ---Request error---

        Uri: ${err.response?.realUri}
        Response: ${err.response?.data}
        StatusCode: ${err.response?.statusCode}
        StatusMessage: ${err.response?.statusMessage}
    ''');

    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logger.i('''
        ---Making a request---

        Uri: ${options.uri}
        Data: ${options.data}
        Params: ${options.queryParameters}
        Headers: ${options.headers}
    ''');

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('''
        ---RESPONSE---
        Uri ${response.realUri}
        Data: ${response.data}
        Headers: ${response.headers}
    ''');
    return handler.next(response);
  }
}
