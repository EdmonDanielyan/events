//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

library main_api_client.api;

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:main_api_client/serializers.dart';
import 'package:main_api_client/auth/api_key_auth.dart';
import 'package:main_api_client/auth/basic_auth.dart';
import 'package:main_api_client/auth/oauth.dart';
import 'package:main_api_client/api/announcements_api.dart';
import 'package:main_api_client/api/auth_api.dart';
import 'package:main_api_client/api/contacts_api.dart';
import 'package:main_api_client/api/events_api.dart';
import 'package:main_api_client/api/news_api.dart';
import 'package:main_api_client/api/publications_api.dart';
import 'package:main_api_client/api/search_api.dart';
import 'package:main_api_client/api/thank_api.dart';
import 'package:main_api_client/api/user_api.dart';

final _defaultInterceptors = [
  OAuthInterceptor(),
  BasicAuthInterceptor(),
  ApiKeyAuthInterceptor()
];

class MainApiClient {
  Dio dio;
  Serializers serializers;
  
    // *** YAR: ORIGINAL BASE PATH
    // String basePath = 'https://portal.irkutskoil.ru/api/v1';
    String basePath = 'https://mpt-test-portal.irkutskoil.ru/api/v1';

  MainApiClient(
      {this.dio,
      Serializers serializers,
      String basePathOverride,
      List<Interceptor> interceptors}) {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: basePathOverride ?? basePath,
        connectTimeout: 15000,
        receiveTimeout: 15000,
      );
      this.dio = new Dio(options);
    }

    if (interceptors == null) {
      this.dio.interceptors.addAll(_defaultInterceptors);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }

    this.serializers = serializers ?? standardSerializers;
  }

  void setOAuthToken(String name, String token) {
    (this.dio.interceptors.firstWhere((element) => element is OAuthInterceptor,
            orElse: null) as OAuthInterceptor)
        ?.tokens[name] = token;
  }

  void setBasicAuth(String name, String username, String password) {
    (this.dio.interceptors.firstWhere(
            (element) => element is BasicAuthInterceptor,
            orElse: null) as BasicAuthInterceptor)
        ?.authInfo[name] = BasicAuthInfo(username, password);
  }

  void setApiKey(String name, String apiKey) {
    (this.dio.interceptors.firstWhere(
            (element) => element is ApiKeyAuthInterceptor,
            orElse: null) as ApiKeyAuthInterceptor)
        ?.apiKeys[name] = apiKey;
  }

  /**
    * Get AnnouncementsApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
  AnnouncementsApi getAnnouncementsApi() {
    return AnnouncementsApi(dio, serializers);
  }

  /**
    * Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
  AuthApi getAuthApi() {
    return AuthApi(dio, serializers);
  }

  /**
    * Get ContactsApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
  ContactsApi getContactsApi() {
    return ContactsApi(dio, serializers);
  }

  /**
    * Get EventsApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
  EventsApi getEventsApi() {
    return EventsApi(dio, serializers);
  }

  /**
    * Get NewsApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
  NewsApi getNewsApi() {
    return NewsApi(dio, serializers);
  }

  /**
    * Get PublicationsApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
  PublicationsApi getPublicationsApi() {
    return PublicationsApi(dio, serializers);
  }

  /**
    * Get SearchApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
  SearchApi getSearchApi() {
    return SearchApi(dio, serializers);
  }

  /**
    * Get ThankApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
  ThankApi getThankApi() {
    return ThankApi(dio, serializers);
  }

  /**
    * Get UserApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
  UserApi getUserApi() {
    return UserApi(dio, serializers);
  }
}
