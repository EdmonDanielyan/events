import 'package:flutter/material.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
      child: const InkPageLoader(),
    );
  }
}
