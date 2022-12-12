import 'package:image_picker/image_picker.dart';
import 'package:ink_mobile/utils/permissions_util.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerUtil {
  PermissionsUtil permissions = PermissionsUtil(PermissionType.photo);

  Future<String?> getFromGallery() async {
    XFile? pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    print("PATH OF IMAGE ${pickedFile?.path}");
    return pickedFile?.path;
  }

  Future<String?> getFromCamera() async {
    XFile? pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera);
    print("PATH OF IMAGE ${pickedFile?.path}");
    return pickedFile?.path;
  }
}
