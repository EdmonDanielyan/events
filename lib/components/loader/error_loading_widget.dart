import 'package:flutter/material.dart';

class ErrorLoadingWidget extends StatelessWidget {
  final String errorMsg;
  const ErrorLoadingWidget({Key? key, required this.errorMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        errorMsg,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
