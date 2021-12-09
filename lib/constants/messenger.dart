import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

const dev =  Environment("dev");
const prod =  Environment("prod");

@module
abstract class MessengerDev {

  @dev
  @Named("natsWssUrl")
  String get natsWssUrl => kReleaseMode ? "wss://cloud.jetrabbits.com:9090": "wss://cloud.jetrabbits.com:9090";

  @dev
  @Named("natsCluster")
  String get natsCluster => kReleaseMode ? "test-cluster": "test-cluster";

  @dev
  @Named("natsCertPath")
  String get natsCertPath => kReleaseMode ? "assets/certs/cloud.jetrabbits.com.pem": "assets/certs/cloud.jetrabbits.com.pem";
}

@module
abstract class MessengerProd {

  @prod
  @Named("natsWssUrl")
  String get natsWssUrl => kReleaseMode ? "wss://cloud.jetrabbits.com:9090": "wss://cloud.jetrabbits.com:9090";

  @prod
  @Named("natsCluster")
  String get natsCluster => kReleaseMode ? "test-cluster": "test-cluster";

  @prod
  @Named("natsCertPath")
  String get natsCertPath => kReleaseMode ? "assets/certs/cloud.jetrabbits.com.pem": "assets/certs/cloud.jetrabbits.com.pem";
}

@module
abstract class MessengerCertificate {
  @preResolve
  @Named("natsCert")
  Future<Uint8List> get natsCert async => (await rootBundle.load(GetIt.I(instanceName: 'natsCertPath'))).buffer.asUint8List();
}
