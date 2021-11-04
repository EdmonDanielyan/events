import 'package:flutter/material.dart';
import 'package:ink_mobile/models/birthday_data.dart';

class BirthdayTodayElement extends StatelessWidget {
  const BirthdayTodayElement({Key? key, required this.birthday})
      : super(key: key);

  final BirthdayData birthday;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/personal',
                        arguments: {'id': birthday.id});
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: birthday.pathToAvatar != null
                        ? NetworkImage(birthday.pathToAvatar!)
                        : AssetImage('assets/images/avatars/avatar_default.png')
                            as ImageProvider,
                  ),
                ),
              )),
          Expanded(
              flex: 8,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      birthday.name ?? '',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: birthday.city,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text: '. ', style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: birthday.workPosition,
                            style: TextStyle(color: Colors.black)),
                      ]),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
