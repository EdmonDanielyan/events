import 'package:permission_handler/permission_handler.dart';

enum PermissionType {
  contacts,
  photo,
  geolocation
}

class PermissionsUtil {
  PermissionType permissionType;
  PermissionsUtil(this.permissionType);

  Future<bool> askPermissions() async {
    PermissionStatus permissionStatus = await _getPermission();
    return permissionStatus == PermissionStatus.granted;
  }

  Future<PermissionStatus> _getPermission() async {
    Permission permission;
    switch (permissionType) {
      case PermissionType.contacts:
        permission = Permission.contacts;
        break;
      case PermissionType.photo:
        permission = Permission.photos;
        break;
      case PermissionType.geolocation:
        permission = Permission.location;
        break;
    }

    PermissionStatus permissionStatus = await permission.status;
    if (permissionStatus != PermissionStatus.granted &&
        permissionStatus != PermissionStatus.permanentlyDenied) {
       permissionStatus = await permission.request();
    }
    return permissionStatus;
  }
}