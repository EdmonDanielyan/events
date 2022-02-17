import 'package:flutter/material.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/models/birthday_data.dart';

class BirthdayAvatar extends StatelessWidget {
  final BirthdayData birthday;
  const BirthdayAvatar({Key? key, required this.birthday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/personal',
              arguments: {'id': birthday.id});
        },
        child: CachedCircleAvatar(
          url: birthday.pathToAvatar ?? "",
        ),
      ),
    );
  }
}
