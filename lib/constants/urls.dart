import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/setup.dart';

//todo: Разнести константы API и Nats

@module
abstract class UrlsConfigTest {
  @test
  @Named("natsWssUrl")
  String get natsWssUrl => "wss://messenger.jetrabbits.com";

  @test
  @Named("natsCluster")
  String get natsCluster => "ink";

  @test
  @Named("natsCertificatePath")
  String get natsCertificatePath => "assets/certs/messenger.jetrabbits.com.pem";

  @test
  @Named("apiUrl")
  String get apiUrl => "https://test.ink.vpool.qsoft.ru/api/v1";

  @test
  @Named("apiCertificatePath")
  String get apiCertificatePath => "assets/certs/test.ink.vpool.qsoft.ru.pem";
}

@module
abstract class UrlsConfigDev {
  @dev
  @Named("natsWssUrl")
  String get natsWssUrl => "wss://messenger-dev.jetrabbits.com";

  @dev
  @Named("natsCluster")
  String get natsCluster => "ink";

  @dev
  @Named("natsCertificatePath")
  String get natsCertificatePath => "assets/certs/messenger-dev.jetrabbits.com.pem";

  @dev
  @Named("apiUrl")
  String get apiUrl => "https://test.ink.vpool.qsoft.ru/api/v1";

  @dev
  @Named("apiCertificatePath")
  String get apiCertificatePath => "assets/certs/test.ink.vpool.qsoft.ru.pem";
}

@module
abstract class UrlsConfigProd {
  @prod
  @Named("natsWssUrl")
  String get natsWssUrl => "wss://messenger.irkutskoil.ru:442";

  @prod
  @Named("natsCluster")
  String get natsCluster => "ink";

  @prod
  @Named("natsCertificatePath")
  String get natsCertificatePath => "assets/certs/_.irkutskoil.ru.pem";

  @prod
  @Named("apiUrl")
  String get apiUrl => "https://portal.irkutskoil.ru/api/v1";

  @prod
  @Named("apiCertificatePath")
  String get apiCertificatePath => "assets/certs/_.irkutskoil.ru.pem";
}

@module
abstract class UrlsConfigUnitTest {
  @unitTest
  @Named("natsWssUrl")
  String get natsWssUrl => "tcp://cloud.jetrabbits.com:7070";

  @unitTest
  @Named("natsCluster")
  String get natsCluster => kReleaseMode ? "test-cluster" : "test-cluster";

  @unitTest
  @Named("natsCertificatePath")
  String get natsCertificatePath => "./assets/certs/cloud.jetrabbits.com.pem";

  @unitTest
  @Named("apiUrl")
  String get apiUrl => "https://mobile.ink.vpool.qsoft.ru/api/v1";

  @unitTest
  @Named("apiCertificatePath")
  String get apiCertificatePath => "assets/certs/mobile.ink.vpool.qsoft.ru.pem";
}
