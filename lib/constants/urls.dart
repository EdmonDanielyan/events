import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Urls {
  @Named("natsWssUrl")
  String get natsWssUrl => kReleaseMode ? "wss://cloud.jetrabbits.com:9090": "wss://cloud.jetrabbits.com:9090";

  @Named("natsCluster")
  String get natsCluster => kReleaseMode ? "test-cluster": "test-cluster";

  @Named("natsCertPath")
  String get natsCertPath => kReleaseMode ? "assets/certs/cloud.jetrabbits.com.pem": "assets/certs/cloud.jetrabbits.com.pem";
}
