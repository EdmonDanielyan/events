import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinCodeTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final Widget Function(String?, String)? errorBuilder;
  const PinCodeTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onCompleted,
    this.errorBuilder,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      errorBuilder: errorBuilder ??
          (str, str2) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  str ?? "",
                  style: TextStyle(fontSize: 13.0, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
      validator: validator,
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}
