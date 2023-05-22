import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/palette.dart';

import 'loader/awesome_loader.dart';

class InkPageLoader extends StatelessWidget {
  const InkPageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 50.0,
        child: AwesomeLoader(
          color: Palette.greenE4A,
        ),
      ),
    );
  }
}
