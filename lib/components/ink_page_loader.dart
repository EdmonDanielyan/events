import 'package:flutter/material.dart';

import 'loader/awesome_loader.dart';

class InkPageLoader extends StatelessWidget {
  const InkPageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50.0,
        height: 50.0,
        child: AwesomeLoader(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
