import 'package:location/location.dart';

class LocationConst {
  static int locationInterval = 10 * 1000;
  static LocationAccuracy locationAccurancy = LocationAccuracy.balanced;
  static int preferredIntervalBackgroundInMinutes = 1;
  static int locationCacheAliveMinutes = 1;
}