import 'dart:convert';

import 'package:ink_mobile/utils/permissions_util.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationUtil {
  PermissionsUtil permissions = PermissionsUtil(PermissionType.geolocation);

  Future<String> getLocation() async {
    String locationJson = "";
    bool gotAccess = await permissions.askPermissions();
    if (gotAccess) {
      Position position = await Geolocator.getCurrentPosition();
      Map<String, double> coordinates = {"lat": position.latitude, "lon": position.longitude};
      locationJson = jsonEncode(coordinates);
    }
    return locationJson;
  }
}