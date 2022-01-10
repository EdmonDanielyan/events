import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class FileFunctions {
  Future<File?> getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }

    return null;
  }

  Future<File?> cropImage(File image) async {
    return await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      cropStyle: CropStyle.circle,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: localizationInstance.edit,
        toolbarColor: Colors.blueGrey[400],
        statusBarColor: Colors.blueGrey,
      ),
      iosUiSettings: IOSUiSettings(
        title: "",
        doneButtonTitle: localizationInstance.save,
        cancelButtonTitle: localizationInstance.cancel,
      ),
    );
  }
}
