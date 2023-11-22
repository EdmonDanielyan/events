import 'package:flutter/material.dart';

class IconOnTop extends StatelessWidget {
  final double? width;
  final double? height;
  const IconOnTop({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(150.0),
      ),
      child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
    );
  }
}
