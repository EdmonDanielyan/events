import 'dart:io';

import 'package:ink_mobile/messenger/api/interceptors/token_interceptor.dart';
import 'package:ink_mobile/messenger/constants/api.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: MessengerApiConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/archive/upload")
  Future<void> uploadArchive(@Part() File file);
}

class MessengerApi {
  final bool useTokenInterceptor;
  final bool passError;
  const MessengerApi({this.useTokenInterceptor = true, this.passError = true});

  Dio get dioClient {
    final dio = Dio(
      BaseOptions(
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "Content-Type": "application/json",
          "Accept": "*/*",
          "Accept-Encoding": "gzip, deflate, br",
        },
      ),
    );
    if (useTokenInterceptor) {
      dio.interceptors.add(TokenInterceptor(passError: passError));
    }

    return dio;
  }

  RestClient get client {
    return RestClient(dioClient);
  }

  Future<Response<List<int>>> downloadArchive() async {
    final url = MessengerApiConstants.baseUrl + "/archive/download";
    return await dioClient.get<List<int>>(url,
        options: Options(responseType: ResponseType.bytes));
    // return await dioClient.download(
    //     url, '');
  }
}
