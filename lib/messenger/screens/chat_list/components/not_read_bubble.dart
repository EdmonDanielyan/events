import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';

class NotReadBubbble extends StatelessWidget {
  final int count;
  const NotReadBubbble(this.count, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 4.0),
      decoration: BoxDecoration(
        color: const Color(0XFF5FB9CF),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: GoogleText(
        "$count",
        textAlign: TextAlign.center,
        color: Colors.white,
        fontSize: 12.0,
      ),
    );
  }
}
