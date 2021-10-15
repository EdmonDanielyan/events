import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ink_mobile/components/icon_on_top.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/functions/file_functions.dart';

class ChangableAvatar extends StatefulWidget {
  final String url;
  const ChangableAvatar({Key? key, required this.url}) : super(key: key);

  @override
  _ChangableAvatarState createState() => _ChangableAvatarState();
}

class _ChangableAvatarState extends State<ChangableAvatar> {
  File? image;

  Future<void> _pickImageFromGallery() async {
    image = await FileFunctions.getImageFromGallery();
    if (image != null) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          CustomCircleAvatar(
            file: image != null ? image : null,
            url: image == null ? widget.url : null,
            avatarWidth: double.infinity,
            avatarHeight: double.infinity,
          ),
          InkWell(
            onTap: () => _pickImageFromGallery(),
            child: IconOnTop(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
