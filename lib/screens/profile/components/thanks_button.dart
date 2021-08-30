import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThanksButton extends StatelessWidget {
  final int userId;
  static const String THANK = 'Поблагодарить';

  const ThanksButton({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileCubit userCubit = BlocProvider.of<ProfileCubit>(context);
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
              userCubit.refresh();
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
                      )
                    )
                ),
                child: Text(
                  THANK,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 19,
                  ),
                )
            ),
          ),
        )
      ],
    );
  }
}
