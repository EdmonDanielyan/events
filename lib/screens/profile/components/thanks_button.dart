import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import '../profile_screen.dart';

class ThanksButton extends StatelessWidget {
  final int userId;

  const ThanksButton({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    final ProfileCubit userCubit = ProfileScreen.of(context).profileCubit;
    return Column(
      children: [
        Divider(
          thickness: 1,
          indent: 15,
          endIndent: 15,
        ),
        Container(
          child: TextButton(
            onPressed: () {
              userCubit.thanks(userId);
            },
            child: Container(
              padding: EdgeInsets.only(
                bottom: 1,
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ))),
              child: Text(
                _strings.thank,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 19,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
