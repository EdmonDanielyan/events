import 'package:image_picker/image_picker.dart';

enum ImagePickerType {
  gallery,
  camera
}

class ImagePickerUtil {

  Future<String?> getImage(ImagePickerType imagePickerType) async {
    XFile? pickedFile;
    if (imagePickerType == ImagePickerType.gallery) {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    }
    print("PATH OF IMAGE ${pickedFile?.path}");
    return pickedFile?.path;
  }
}
