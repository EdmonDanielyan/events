import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';

class InkPageLoader extends StatelessWidget {
  const InkPageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AwesomeLoader(
      loaderType: AwesomeLoader.AwesomeLoader2,
      color: Theme.of(context).primaryColor,
    ));
  }
}
