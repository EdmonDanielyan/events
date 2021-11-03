import 'package:flutter/foundation.dart';

class Urls {
  static bool appDebugMode = false;
  static String natsHost = "cloud.jetrabbits.com";
  static int natsPort = 7070;
  static int natsWssPort = 9090;
  static String natsCluster = "test-cluster";

  static load() {
    if (kReleaseMode) {
      appDebugMode = true;
      natsHost = "cloud.jetrabbits.com";
      natsPort = 7070;
      natsWssPort = 9090;
      natsCluster = "test-cluster";
    }
  }
}
