import 'package:flutter/material.dart';
import 'package:ink_mobile/models/birthday_data.dart';

class BirthdayBody extends StatelessWidget {
  final BirthdayData birthday;
  const BirthdayBody({Key? key, required this.birthday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: RichText(
        text: TextSpan(
          children: [
            if (birthday.city != null && birthday.city!.trim().isNotEmpty) ...[
              TextSpan(
                text: birthday.city,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextSpan(
                text: '. ',
                style: TextStyle(color: Colors.black),
              ),
            ],
            TextSpan(
              text: birthday.workPosition,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
