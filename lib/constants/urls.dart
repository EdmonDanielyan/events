import 'package:flutter/foundation.dart';

class Urls {
  static bool appDebugMode = false;
  static String natsWssUrl = "wss://cloud.jetrabbits.com:9090";
  static String natsCluster = "test-cluster";
  static String natsCertPath = "assets/certs/cloud.jetrabbits.com.pem";

  static load() {
    if(!kReleaseMode){
      appDebugMode = true;
      natsWssUrl = "wss://cloud.jetrabbits.com:9090";
      natsCluster = "test-cluster";
      natsCertPath = "assets/certs/cloud.jetrabbits.com.pem";
    }
  }
}