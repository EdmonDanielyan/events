import 'package:flutter/material.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_body.dart';

import '../../../messenger/functions/size_config.dart';
import 'birthday_avatar.dart';

class BirthdayOtherDaysElement extends StatelessWidget {
  const BirthdayOtherDaysElement({Key? key, required this.birthday})
      : super(key: key);

  final BirthdayData birthday;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BirthdayAvatar(birthday: birthday),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 6,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/personal',
                                arguments: {'id': birthday.id},
                              );
                            },
                            child: Text(
                              birthday.name ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig(context, 14.0)
                                    .getProportionateScreenHeight,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                      Expanded(
                        flex: 4,
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 7.0),
                          child: Text(
                            birthday.birthday!,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig(context, 14.0)
                                  .getProportionateScreenHeight,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                BirthdayBody(birthday: birthday),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
