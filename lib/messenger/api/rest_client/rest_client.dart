import 'dart:convert';

import 'package:ink_mobile/messenger/api/interceptors/token_interceptor.dart';
import 'package:ink_mobile/messenger/api/rest_client/chat/create/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/chat/create/response.dart';
import 'package:ink_mobile/messenger/api/rest_client/chat/invite/response.dart';
import 'package:ink_mobile/messenger/api/rest_client/message/delete/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/message/get/response.dart';
import 'package:ink_mobile/messenger/api/rest_client/message/update/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/message/update/response.dart';
import 'package:ink_mobile/messenger/cubits/cached/base_url/base_url_cubit.dart';
import 'package:ink_mobile/setup.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'chat/get/response.dart';
import 'chat/get_list/response.dart';
import 'chat/invite/request.dart';
import 'chat/remove_participant/request.dart';
import 'chat/remove_participant/response.dart';
import 'chat/update/request.dart';
import 'chat/update/response.dart';
import 'message/delete/response.dart';
import 'message/read/response.dart';
import 'message/send/request.dart';
import 'message/send/response.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/chats/create")
  Future<CreateChatResponse> createChat(@Body() CreateChatRequest request);
  @PUT("/chats/{id}")
  Future<UpdateChatResponse> updateChat(
    @Path() int id,
    @Body() UpdateChatRequest request,
  );
  @POST("/chats/invite")
  Future<InviteChatResponse> chatInvite(@Body() InviteChatRequest request);
  @POST("/chats/kick")
  Future<RemoveParticipantResponse> kickUser(
      @Body() RemoveParticipantRequest request);
  @GET("/chats")
  Future<GetChatsResponse> getChats(
      @Query("offset") int offset, @Query("count") int count);

  @GET("/chats/list")
  Future<GetChatListResponse> getChatList();

  @POST("/messages/send")
  Future<SendMessageResponse> sendMessage(@Body() SendMessageRequest request);
  @PUT("/messages/{id}")
  Future<UpdateMessageResponse> updateMessage(
      @Path() int id, @Body() UpdateMessageRequest request);
  @POST("/messages/delete")
  Future<DeleteMessagesResponse> deleteMessages(
      @Body() DeleteMessagesRequest request);
  @GET("/messages/{chatId}")
  Future<GetMessagesResponse> getMessages(
    @Path() int chatId,
    @Query("offset") int offset,
    @Query("count") int count,
  );
  @POST("/messages/read/{messageId}")
  Future<ReadMessagesResponse> readMessage(@Path() int messageId);
}

class MainApi {
  final bool useTokenInterceptor;
  const MainApi({this.useTokenInterceptor = true});

  RestClient get client {
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
      dio.interceptors.add(TokenInterceptor());
    }
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('${options.method} ${options.baseUrl}${options.path}');

      print('Params:');
      options.queryParameters.forEach((k, v) => print('$k: $v'));
      if (options.data != null) {
        print('Body:');
        print(jsonEncode(options.data));
      }

      return handler.next(options);
    }));

    return RestClient(dio, baseUrl: getIt<BaseUrlCubit>().url);
  }
}
