import 'package:flutter/material.dart';

class AppBarBackBtn extends StatelessWidget {
  final void Function()? onPressed;
  const AppBarBackBtn({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      onPressed:
          onPressed ?? () async => await Navigator.of(context).maybePop(),
    );
  }
}
