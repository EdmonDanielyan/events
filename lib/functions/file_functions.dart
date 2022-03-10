import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FileFunctions {
  Future<File?> getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }

    return null;
  }
}
