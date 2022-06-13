import 'package:flutter/material.dart';

class TopLineWidget extends StatelessWidget {
  const TopLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 45,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
    );
  }
}
